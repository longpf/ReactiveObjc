//
//  Objc_test.h
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/16.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Objc_test : NSObject

- (void)v_instance_method:(id)para;
- (void)v_instance_method:(id)para p1:(id)p1;
- (id)instacen_method:(id)p;
+ (void)class_method:(id)p;

- (void)v_instance_assign:(int)intparam size:(CGSize)size;

- (NSString *)instance_method:(CGRect)rect;

@end
