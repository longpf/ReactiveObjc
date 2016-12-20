//
//  NSObject+SRACObserver.h
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/19.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SRACObservingBlock)(id observedObject,SEL sel, NSArray *arguments);

@interface NSObject (SRACObserver)

- (void)addObserver:(NSObject *)observer forSelector:(SEL)selector withBlock:(SRACObservingBlock)block;


@end
