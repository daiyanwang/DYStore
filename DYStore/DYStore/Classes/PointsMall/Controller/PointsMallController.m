//
//  PointsMallController.m
//  DYStore
//
//  Created by MyMac on 15/9/25.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "PointsMallController.h"

@interface PointsMallController ()

@end

@implementation PointsMallController

/**
 *  statusBar变为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.alpha = 0.1;
    
}

@end
