//
//  NSObject+SRACObserver.h
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/19.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SRACObservationInfo : NSObject

@property (nonatomic, assign) NSObject *observer;
@property (nonatomic) SEL sel;
@property (nonatomic, copy) id block;
@property (nonatomic, copy) NSArray *arguments;

- (instancetype)initWithObserver:(NSObject *)observer sel:(SEL)sel block:(id)block;

@end


@interface NSObject (SRACObserver)

- (void)addObserver:(NSObject *)observer forSelector:(SEL)selector withBlock:(id)block;


@end
