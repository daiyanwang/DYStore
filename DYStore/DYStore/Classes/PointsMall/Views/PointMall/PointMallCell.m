//
//  PointMallCell.m
//  DYStore
//
//  Created by MyMac on 15/9/30.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "PointMallCell.h"

@interface PointMallCell ()

@property (nonatomic,strong) UILabel *proNameLabel; /**< 名称*/
@property (nonatomic,strong) UILabel *pointNumLabel; /**< 积分数量*/
@property (nonatomic,strong) UIImageView *icon; /**< 积分图标*/
@property (nonatomic,strong) UIImageView *proImage; /**< 产品图片*/

@end

@implementation PointMallCell


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
        [self.contentView addSubview:self.proNameLabel];
        [self.contentView addSubview:self.pointNumLabel];
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.proImage];
    }
    return self;
}

#pragma mark - getter and setter
/**< 名称*/
- (UILabel *)proNameLabel{
    if (!_proNameLabel) {
        _proNameLabel = [[UILabel alloc] init];
        _proNameLabel.font = [UIFont fontWithSize:13.0f];
        _proNameLabel.textColor = RGB(102, 102, 102);
        _proNameLabel.text = @"细胞奇迹面膜礼盒装";
    }
    return _proNameLabel;
}

/**< 积分数量*/
- (UILabel *)pointNumLabel{
    if (!_pointNumLabel) {
        _pointNumLabel = [[UILabel alloc] init];
        _pointNumLabel.font = [UIFont fontWithSize:10.0f];
        _pointNumLabel.textColor = RGB(177, 108, 56);
        _pointNumLabel.text = @"2999";
    }
    return _pointNumLabel;
}

/**< 积分图标*/
- (UIImageView *)icon{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.image = [UIImage imageNamed:@"RecommendationIcon"];
    }
    return _icon;
}

/**< 产品图片*/
- (UIImageView *)proImage{
    if (!_proImage) {
        _proImage = [[UIImageView alloc] init];
        _proImage.image = [UIImage imageNamed:@"pho_bg_2"];
//        _proImage.backgroundColor = [UIColor redColor];
        _proImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _proImage;
}

#pragma mark - 设置尺寸
- (void)layoutSubviews{
    /**< 名称*/
    [self.proNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).with.offset(15);
        make.left.mas_equalTo(self.mas_left).with.offset(19);
    }];
    
    /**< 积分数量*/
    [self.pointNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.proNameLabel.mas_bottom).with.offset(7);
        make.left.mas_equalTo(self.proNameLabel.mas_left);
    }];
    
    /**< 积分图标*/
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.pointNumLabel.mas_top);
        make.left.mas_equalTo(self.pointNumLabel.mas_right).with.offset(3);
    }];
    
    /**< 产品图片*/
    [self.proImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.icon.mas_bottom).with.offset(3);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
}



@end
