//
//  PointNum.m
//  DYStore
//
//  Created by MyMac on 15/9/28.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分和兑换积分部分

#import "PointNum.h"

@interface PointNum ()

@property (nonatomic,strong) UIButton *leftButton; /**< 左侧button*/
@property (nonatomic,strong) UIButton *rightButton; /**< 右侧button*/

@property (nonatomic,strong) UIView *topLine; /**< 顶部线*/

@property (nonatomic,strong) UIImageView *PointIcon; /**< 积分icon*/

@property (nonatomic,strong) UILabel *pointTextLabel; /**< 积分文字*/

@property (nonatomic,strong) UIImageView *RedeemPointsIcon; /**< 兑换积分icon*/

@property (nonatomic,strong) UILabel *RedeemPointsLabel; /** 文字-兑换积分*/


@end

@implementation PointNum

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
        [self addSubview:self.topLine];
        [self addSubview:self.PointIcon];
        [self addSubview:self.pointTextLabel];
        [self addSubview:self.pointNumLabel];
        [self addSubview:self.RedeemPointsLabel];
        [self addSubview:self.RedeemPointsIcon];
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
    }
    return self;
}

#pragma mark - events
- (void)ClickedButton:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(pointNum:DidClickedButton:)]) {
        [self.delegate pointNum:self DidClickedButton:button];
    }
}

#pragma mark - getter and setter
/**< 左侧button*/
- (UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        _leftButton.backgroundColor = [UIColor clearColor];
        _leftButton.tag = leftButtonTag;
        [_leftButton addTarget:self action:@selector(ClickedButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

/**< 右侧button*/
- (UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.backgroundColor = [UIColor clearColor];
        _rightButton.tag = rightButtonTag;
        [_rightButton addTarget:self action:@selector(ClickedButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

/**< 顶部线*/
- (UIView *)topLine{
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = RGB(218, 218, 218);
    }
    return _topLine;
}

/**< 积分icon*/
- (UIImageView *)PointIcon{
    if (!_PointIcon) {
        _PointIcon = [[UIImageView alloc] init];
        _PointIcon.image = [UIImage imageNamed:@"pointIcon"];
    }
    return _PointIcon;
}

/**< 积分文字*/
- (UILabel *)pointTextLabel{
    if (!_pointTextLabel) {
        _pointTextLabel = [[UILabel alloc] init];
        _pointTextLabel.text = @"积分";
        _pointTextLabel.textColor = RGB(102, 102, 102);
        _pointTextLabel.font = [UIFont fontWithSize:11];
    }
    return _pointTextLabel;
}

/**< 积分数量*/
- (UILabel *)pointNumLabel{
    if (!_pointNumLabel) {
        _pointNumLabel = [[UILabel alloc] init];
        _pointNumLabel.text = @"8989";
        _pointNumLabel.textColor = RGB(177, 108, 56);
        _pointNumLabel.font = [UIFont systemFontOfSize:11];
    }
    return _pointNumLabel;
}

/**< 兑换积分icon*/
- (UIImageView *)RedeemPointsIcon{
    if (!_RedeemPointsIcon) {
        _RedeemPointsIcon = [[UIImageView alloc] init];
        _RedeemPointsIcon.image = [UIImage imageNamed:@"redeemPointsIcon"];
    }
    return _RedeemPointsIcon;
}

/** 文字-兑换积分*/
- (UILabel *)RedeemPointsLabel{
    if (!_RedeemPointsLabel) {
        _RedeemPointsLabel = [[UILabel alloc] init];
        _RedeemPointsLabel.text = @"兑换积分";
        _RedeemPointsLabel.font = [UIFont fontWithSize:11];
        _RedeemPointsLabel.textColor = RGB(102, 102, 102);
    }
    return _RedeemPointsLabel;
}

#pragma mark - 设置尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    
    /**< 左侧button*/
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
//        make.left.mas_equalTo(@0);
        make.height.mas_equalTo(self.mas_height);
        make.width.mas_equalTo(mainScreenW * 0.5);
    }];
    
    /**< 右侧button*/
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(self.leftButton.mas_right);
        make.height.mas_equalTo(self.leftButton.mas_height);
        make.width.mas_equalTo(self.leftButton.mas_width);
    }];
    
    /**< 顶部线*/
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(@(1 * SINGLE_LINE_WIDTH));
    }];

    /**< 积分icon*/
    [self.PointIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.PointIcon.image.size);
        make.left.mas_equalTo(self.topLine.mas_left).with.offset(self.width / 16);
        make.top.mas_equalTo(@((self.height - self.PointIcon.image.size.height - 1 * SINGLE_LINE_WIDTH) * 0.5));
    }];

    /**< 积分文字*/
    CGSize pointTextLabelSize = [self.pointTextLabel.text sizeWithFont:self.pointTextLabel.font];
    [self.pointTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.PointIcon.mas_right).with.offset(3);
        make.size.mas_equalTo(pointTextLabelSize);
        make.top.mas_equalTo(@(self.height * 0.5 - pointTextLabelSize.height * 0.5));
    }];

    /**< 积分数量*/
    [self.pointNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.pointTextLabel.mas_top);
        make.left.mas_equalTo(self.pointTextLabel.mas_right).with.offset(5);
    }];
    
    /** 文字-兑换积分*/
    [self.RedeemPointsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo([self.RedeemPointsLabel.text sizeWithFont:self.RedeemPointsLabel.font]);
        make.top.mas_equalTo(self.pointTextLabel.mas_top);
        make.right.mas_equalTo(self.topLine.mas_right).with.offset(-(self.width / 16));
    }];
    
    /**< 兑换积分icon*/
    [self.RedeemPointsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.RedeemPointsIcon.image.size);
        make.right.mas_equalTo(self.RedeemPointsLabel.mas_left).with.offset(-3);
        make.top.mas_equalTo(self.PointIcon.mas_top);
    }];
    
}

@end
