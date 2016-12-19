//
//  Utility.m
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/16.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import "Utility.h"

@implementation Utility

inline void func(id target,SEL sel,IMP imp,NSArray *args,BOOL hasReturnValue,id returnValu){
    
    switch (args.count) {
        case 2:
            if (hasReturnValue) {
                
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1]);
            }
            break;
        case 3:
            if (hasReturnValue) {
                
            }else{
                void (*func) (id target,SEL sel, ...) = (void *)imp;
                func(target,sel,args[1],args[2]);
            }
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
        case 10:
            
            break;
        case 11:
            
            break;
        case 12:
            
            break;
            
            
        default:
            break;
    }
    
    
    
    
    
    
};



@end
