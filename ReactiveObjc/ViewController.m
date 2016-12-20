//
//  ViewController.m
//  ReactiveObjc
//
//  Created by 龙鹏飞 on 2016/12/16.
//  Copyright © 2016年 https://github.com/LongPF/ReactiveObjc. All rights reserved.
//

#import "ViewController.h"
#import "Objc_test.h"

@interface ViewController ()

@property (nonatomic, strong) Objc_test *objc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.objc = [Objc_test new];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)buttonAction:(id)sender {
//    [self.objc v_instance_method:@"data"];
    [self.objc v_instance_assign:66 size:CGSizeMake(30, 30)];

    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
