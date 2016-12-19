//
//  Objc_test.m
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/16.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import "Objc_test.h"
#import "Utility.h"

#import <objc/runtime.h>

@implementation Objc_test


+ (void)load
{
    Method instace_method = class_getInstanceMethod(self, @selector(v_instance_assign:size:));
    Method class_method = class_getClassMethod(self, @selector(v_instance_method:));
    
    Method method = NULL;
    IMP imp = NULL;
    
    if (instace_method) {
        
        method = instace_method;
        imp = method_getImplementation(instace_method);
        
    }else if(class_method){
        
        method = class_method;
        imp = method_getImplementation(class_method);
        
    }else{
        
        NSLog(@"error 方法不存在");
        
    }
    
    if (imp) {
        
        //返回类型
        char returnType[512] = {};
        method_getReturnType(method, returnType, 512);
        
        //判断是否有返回值
        __block BOOL hasReturnValue = strcmp(returnType, @encode(void)) != 0;
        
        //获取method参数个数
        __block int numberOfArgs = method_getNumberOfArguments(method);
        
        
        void(^block)(id firstParam, ...) = ^(id firstParam, ...){
            
            //计数用，否则va_list 若传过来的不含有nil，则越界
            int counter = numberOfArgs - 1;
            
            //把参数都存到数组里面
            NSMutableArray *args = [NSMutableArray array];
            
            va_list arguments;
            
            id eachParam;
            if (firstParam) {
                
                [args addObject:firstParam];
                counter --;
                va_start(arguments, firstParam);
                
                while ((eachParam = va_arg(arguments, id))) {
                    
                    [args addObject:eachParam];
                    if (!--counter) {
                        break;
                    }
                    
                }
                va_end(arguments);
            }
            
            if (!hasReturnValue) {
                
                func(firstParam, @selector(v_instance_assign:size:), imp, args, NO, nil);
                
            }else{
                
                
                
            }
            
            for (int i = 0; i < args.count; i++) {
                NSLog(@"%@",args[i]);
            }
            
        };
        
        method_setImplementation(method, imp_implementationWithBlock(block));
        
        
    }
}

- (void)v_instance_method:(id)para
{
    
}

- (void)v_instance_method:(id)para p1:(id)p1
{
    
}

- (id)instacen_method:(id)p
{
    
    return @"returnvalue";
}

+ (void)class_method:(id)p
{
    
}

- (void)v_instance_assign:(int)intparam size:(CGSize)size
{
    
}

@end
