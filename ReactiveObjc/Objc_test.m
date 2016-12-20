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

/*
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
        
        
        void(^block)(id firstArgument, ...) = ^(id firstArgument, ...){
            
            //计数用，否则va_list 若传过来的不含有nil，则越界
            int counter = numberOfArgs - 1;
            
            //把参数都存到数组里面
            NSMutableArray *args = [NSMutableArray array];
            
            
            va_list arguments;
            
            if (firstArgument) {
                
                [args addObject:firstArgument];
                counter --;
                va_start(arguments, firstArgument);

#define ARGUMENT_NUMBER_TYPE(type)    \
    do { \
        type val = 0; \
        val = va_arg(arguments,type); \
        [args addObject:@(val)]; \
    } while (0)
               
#define ARGUMENT_VALUE_TYPE(type,actualType)      \
    do { \
         actualType val; \
         val = va_arg(arguments,actualType); \
         NSValue *value = [NSValue value:&val withObjCType:type]; \
         if (value) {\
            [args addObject:value]; \
         } \
        } while (0);
         
                for (int i = 2; counter --; i++) {
                    
                    char argType[512] = {};
                    method_getArgumentType(method, i, argType, 512);
                    
                    if (strcmp(argType, @encode(id)) == 0 || strcmp(argType, @encode(Class)) == 0) {
                        id arg = va_arg(arguments, id);
                        [args addObject:arg];
                    } else if (strcmp(argType, @encode(char)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(int)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(short)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(long);
                    } else if (strcmp(argType, @encode(long long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(long long);
                    } else if (strcmp(argType, @encode(unsigned char)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(unsigned int)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned int);
                    } else if (strcmp(argType, @encode(unsigned short)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(unsigned long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned long);
                    } else if (strcmp(argType, @encode(unsigned long long)) == 0) {
                        ARGUMENT_NUMBER_TYPE(unsigned long long);
                    } else if (strcmp(argType, @encode(float)) == 0) {
                        ARGUMENT_NUMBER_TYPE(double);
                    } else if (strcmp(argType, @encode(double)) == 0) {
                        ARGUMENT_NUMBER_TYPE(double);
                    } else if (strcmp(argType, @encode(BOOL)) == 0) {
                        ARGUMENT_NUMBER_TYPE(int);
                    } else if (strcmp(argType, @encode(char *)) == 0) {
                        ARGUMENT_NUMBER_TYPE(const char *);
                    } else if (strcmp(argType, @encode(void (^)(void))) == 0) {
                        __unsafe_unretained id block = nil;
                        block = va_arg(arguments, id);
                        [args addObject:[block copy]];
                    }else if (strcmp(argType, @encode(CGPoint)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,CGPoint);
                    }else if (strcmp(argType, @encode(CGSize)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,CGSize);
                    }else if (strcmp(argType, @encode(CGRect))){
                        ARGUMENT_VALUE_TYPE(argType,CGRect);
                    }
                    else if (strcmp(argType, @encode(UIEdgeInsets)) == 0) {
                        ARGUMENT_VALUE_TYPE(argType,UIEdgeInsets);
                    }

                    
                }
#undef ARGUMENT_VALUE_TYPE
                
#undef ARGUMENT_NUMBER_TYPE
                
                
                
                
                va_end(arguments);
            }
            
            if (!hasReturnValue) {
                
                func(firstArgument, @selector(v_instance_assign:size:), imp, args, NO, nil);
                
            }else{
                
                
                
            }
            
            
            
            
            for (int i = 0; i < args.count; i++) {
                NSLog(@"%@",args[i]);
            }
            
        };
        
        method_setImplementation(method, imp_implementationWithBlock(block));
        
        
    }
    
}

*/


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
