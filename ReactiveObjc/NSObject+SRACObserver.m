//
//  NSObject+SRACObserver.m
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/19.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import "NSObject+SRACObserver.h"

#import <objc/runtime.h>
#import <objc/message.h>

NSString *const kSRACClassPrefix = @"SRACNotifying_";

@implementation NSObject (SRACObserver)

- (void)addObserver:(NSObject *)observer forSelector:(SEL)selector withBlock:(id)block
{
    
    Method method = class_getInstanceMethod([self class], selector);
    if (!method) {
        method = class_getClassMethod([self class], selector);
    }
    if (!method) {
        
        NSLog(@"方法不存在");
        return;
    }
    
    Class clazz = object_getClass(self);
    NSString *clazzName = NSStringFromClass(clazz);
    
    if (![clazzName hasPrefix:kSRACClassPrefix]) {
        clazz = [self makeSRACClassWithOriginalClassName:clazzName];
        //修改isa指针
        object_setClass(self, clazz);
    }
    
    //查看生成的中间类是否有要监听的方法
    if (![self hasSelector:selector]) {
        const char *types = method_getTypeEncoding(method);
//        class_addMethod(clazz, selector, imp_implementationWithBlock(), types);
    }
    
}





- (Class)makeSRACClassWithOriginalClassName:(NSString *)originalClassName
{
    //查看是否中间类是否生成过
    NSString *sracClassName = [kSRACClassPrefix stringByAppendingString:originalClassName];
    Class sracClass = NSClassFromString(sracClassName);
    
    if (sracClass) {
        return sracClass;
    }
    
    //没有的话,生成中间类
    Class originClass = NSClassFromString(originalClassName);
    if (!originClass) {
        NSLog(@"参数 originalClassName 有问题");
        return nil;
    }
    sracClass = objc_allocateClassPair(originClass, sracClassName.UTF8String, 0);
    
    //修改class方法 隐藏这个类
    Method classMethod = class_getInstanceMethod(originClass, @selector(class));
    const char *types = method_getTypeEncoding(classMethod);
    class_addMethod(sracClass, @selector(class), imp_implementationWithBlock(^(id target,SEL sel){
        return class_getSuperclass(object_getClass(target));
    }), types);
    
    //告诉runtime 这个类的存在
    objc_registerClassPair(sracClass);
    
    return sracClass;
}

- (BOOL)hasSelector:(SEL)selector
{
    Class clazz = object_getClass(self);
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(clazz, &methodCount);
    for (unsigned int i = 0; i < methodCount; i++) {
        SEL thisSelector = method_getName(methodList[i]);
        if (thisSelector == selector) {
            free(methodList);
            return YES;
        }
    }
    return NO;
}



@end
