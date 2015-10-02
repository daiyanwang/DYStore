//
//  PointsArea.m
//  DYStore
//
//  Created by MyMac on 15/9/29.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分等级区

#import "PointsArea.h"

@interface PointsArea ()

@property (nonatomic,strong) NSArray *PointAreaIcons; /**< Icon图标集合*/

@property (nonatomic,strong) NSArray *PointAreaTitles; /**< titles集合*/

@property (nonatomic,strong) NSMutableArray *imageViews;

@property (nonatomic,strong) NSMutableArray *titles;

@property (nonatomic,strong) NSMutableArray *btns;

@property (nonatomic,strong) UIButton *btn1;


@end

@implementation PointsArea

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.PointAreaIcons = @[@"PointAreaIcon_500",@"PointAreaIcon_1000",@"PointAreaIcon_2000",@"PointAreaIcon_5000"];
        
        self.PointAreaTitles = @[@"500积分区",@"1000积分区",@"2000积分区",@"5000积分区"];
        
        self.imageViews = [NSMutableArray array];
        self.titles = [NSMutableArray array];
        self.btns = [NSMutableArray array];
        
        for (int i = 0; i < self.PointAreaIcons.count; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage imageNamed:self.PointAreaIcons[i]];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.imageViews addObject:imageView];
            [self addSubview:imageView];
            
            UILabel *title = [[UILabel alloc] init];
            title.text = [self.PointAreaTitles[i] description];
            title.textAlignment = NSTextAlignmentCenter;
            title.font = [UIFont fontWithSize:12.0f];
            title.textColor = RGB(102, 102, 102);
            [self addSubview:title];
            [self.titles addObject:title];

            UIButton *button = [[UIButton alloc] init];
            button.tag = i + 15;
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [self.btns addObject:button];
            
        }
    }
    return self;
}

#pragma mark - methods
- (void)buttonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(pointsArea:DidClickedButton:)]) {
        [self.delegate pointsArea:self DidClickedButton:button];
    }
}


#pragma mark - getter and setter


#pragma mark - 设置尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat buttonWidth = self.bounds.size.width / 4;
    CGFloat height = self.bounds.size.height;
    CGFloat margin = 10;
    
    for (int i = 0; i < self.PointAreaIcons.count; i ++) {
        UIImageView *imageView = self.imageViews[i];
        UILabel *title = self.titles[i];
        UIButton *button = self.btns[i];
        
//        CGFloat margin = (buttonWidth - imageView.image.size.width) * 0.5;
        
        imageView.x = buttonWidth * i;
        imageView.y = margin;
        imageView.width = buttonWidth;
        imageView.height = imageView.image.size.height;
        
        title.x = buttonWidth * i;
        title.y = imageView.height;
        title.width = buttonWidth;
        title.height = height - imageView.height + margin;
        
        button.x = buttonWidth * i;
        button.y = 0;
        button.width = buttonWidth;
        button.height = height;
        
        
    }
}

@end
