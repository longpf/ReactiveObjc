//
//  Utility.h
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/16.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SRACObservationInfo;

/**
 将IMP转换换成对应的参数个数的方法并执行

 @param target         执行对象
 @param sel            方法
 @param imp            实现
 @param args           参数数组
 @param hasReturnValue 返回值

 @return 原方法如果有返回值 则返回对应值
 */
id srac_func(id target,SEL sel,IMP imp,NSArray *args,BOOL hasReturnValue);

void srac_block(id block,SRACObservationInfo *info);


@interface Utility : NSObject

@end
