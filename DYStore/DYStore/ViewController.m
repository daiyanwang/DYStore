//
//  ViewController.m
//  DYStore
//
//  Created by MyMac on 15/9/24.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(40, 20, 100, 30);
    label.text = @"测试";
    label.font = [UIFont fontWithName:@"HiraginoSans-W3" size:14];
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
