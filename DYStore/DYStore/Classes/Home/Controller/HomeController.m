//
//  HomeController.m
//  DYStore
//
//  Created by MyMac on 15/9/25.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "HomeController.h"
#import "PointsMallController.h" //积分商城

@interface HomeController ()

@property (nonatomic,strong) UIButton *btn;

@end

@implementation HomeController

/**
 *  statusBar变为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.btn];
    
}

- (void)btnClick{
    
    
    
    PointsMallController *pointMall = [[PointsMallController alloc] init];
    [self.navigationController pushViewController:pointMall animated:YES];
}


- (UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        [_btn setTitle:@"积分商城" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)viewWillLayoutSubviews{
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(@30);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@30);
    }];
}



@end
