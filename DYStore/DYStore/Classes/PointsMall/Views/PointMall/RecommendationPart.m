//
//  RecommendationPart.m
//  DYStore
//
//  Created by MyMac on 15/9/28.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分兑换推荐区

#import "RecommendationPart.h"

@interface RecommendationPart ()

@property (nonatomic,strong) UIButton *leftPart; /**< 左侧部分部分*/
@property (nonatomic,strong) UILabel *leftPartNameLabel;/**< 左侧积分商品名称*/
@property (nonatomic,strong) UILabel *leftPartPointNum;/**< 左侧商品兑换积分数*/
@property (nonatomic,strong) UIImageView *leftPartIcon; /**< 左侧积分Icon*/
@property (nonatomic,strong) UIImageView *leftPartProImage; /**< 左侧商品图片*/

@property (nonatomic,strong) UIButton *RightCorner; /**< 右上角部分*/
@property (nonatomic,strong) UILabel *RightCornerNameLabel;/**< 右上角积分商品名称*/
@property (nonatomic,strong) UILabel *RightCornerPointNum;/**< 右上角商品兑换积分数*/
@property (nonatomic,strong) UIImageView *RightCornerIcon; /**< 右上角积分Icon*/
@property (nonatomic,strong) UIImageView *RightCornerProImage; /**< 右上角商品图片*/

@property (nonatomic,strong) UIButton *BottomRightCorner; /**< 右下角部分*/
@property (nonatomic,strong) UILabel *BottomRightCornerNameLabel;/**< 右下角积分商品名称*/
@property (nonatomic,strong) UILabel *BottomRightCornerPointNum;/**< 右下角商品兑换积分数*/
@property (nonatomic,strong) UIImageView *BottomRightCornerIcon; /**< 右下角积分Icon*/
@property (nonatomic,strong) UIImageView *BottomRightCornerProImage; /**< 右下角商品图片*/

@end

@implementation RecommendationPart

- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.leftPart];
        [self.leftPart addSubview:self.leftPartNameLabel];
        [self.leftPart addSubview:self.leftPartPointNum];
        [self.leftPart addSubview:self.leftPartIcon];
        [self.leftPart addSubview:self.leftPartProImage];
        
        [self addSubview:self.RightCorner];
        [self.RightCorner addSubview:self.RightCornerNameLabel];
        [self.RightCorner addSubview:self.RightCornerPointNum];
        [self.RightCorner addSubview:self.RightCornerIcon];
        [self.RightCorner addSubview:self.RightCornerProImage];
        
        [self addSubview:self.BottomRightCorner];
        [self.BottomRightCorner addSubview:self.BottomRightCornerNameLabel];
        [self.BottomRightCorner addSubview:self.BottomRightCornerPointNum];
        [self.BottomRightCorner addSubview:self.BottomRightCornerIcon];
        [self.BottomRightCorner addSubview:self.BottomRightCornerProImage];
        
    }
    return self;
}


- (void)ActionDo:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(recommendationPart:DidClickedButton:)]) {
        [self.delegate recommendationPart:self DidClickedButton:sender];
    }
}


#pragma mark - getter and setter
/**< 左侧部分部分*/
- (UIButton *)leftPart{
    if (!_leftPart) {
        _leftPart = [[UIButton alloc] init];
        _leftPart.backgroundColor = [UIColor whiteColor];
        _leftPart.tag = leftPartTag;
        [_leftPart addTarget:self action:@selector(ActionDo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftPart;
}

/**< 左侧积分商品名称*/
- (UILabel *)leftPartNameLabel{
    if (!_leftPartNameLabel) {
        _leftPartNameLabel = [[UILabel alloc] init];
        _leftPartNameLabel.textColor = RGB(34, 34, 34);
        _leftPartNameLabel.font = [UIFont fontWithSize:14];
        _leftPartNameLabel.text = @"银色iPhone6s";
    }
    return _leftPartNameLabel;
}

/**< 左侧商品兑换积分数*/
- (UILabel *)leftPartPointNum{
    if (!_leftPartPointNum) {
        _leftPartPointNum = [[UILabel alloc] init];
        _leftPartPointNum.textColor = RGB(177, 108, 56);
        _leftPartPointNum.font = [UIFont fontWithSize:10];
        _leftPartPointNum.text = @"29999";
    }
    return _leftPartPointNum;
}

/**< 左侧积分Icon*/
- (UIImageView *)leftPartIcon{
    if (!_leftPartIcon) {
        _leftPartIcon = [[UIImageView alloc] init];
        _leftPartIcon.image = [UIImage imageNamed:@"RecommendationIcon"];
    }
    return _leftPartIcon;
}

/**< 左侧商品图片*/
- (UIImageView *)leftPartProImage{
    if (!_leftPartProImage) {
        _leftPartProImage = [[UIImageView alloc] init];
        _leftPartProImage.image = [UIImage imageNamed:@"pho_bg_2"];
        _leftPartProImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftPartProImage;
}

/**< 右上角部分*/
- (UIButton *)RightCorner{
    if (!_RightCorner) {
        _RightCorner = [[UIButton alloc] init];
        _RightCorner.backgroundColor = [UIColor whiteColor];
        _RightCorner.tag = RightCornerTag;
        [_RightCorner addTarget:self action:@selector(ActionDo:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _RightCorner;
}

/**< 右上角积分商品名称*/
- (UILabel *)RightCornerNameLabel{
    if (!_RightCornerNameLabel) {
        _RightCornerNameLabel = [[UILabel alloc] init];
        _RightCornerNameLabel.textColor = RGB(34, 34, 34);
        _RightCornerNameLabel.font = [UIFont fontWithSize:14];
        _RightCornerNameLabel.text = @"Apple Watch";
    }
    return _RightCornerNameLabel;
}

/**< 右上角商品兑换积分数*/
- (UILabel *)RightCornerPointNum{
    if (!_RightCornerPointNum) {
        _RightCornerPointNum = [[UILabel alloc] init];
        _RightCornerPointNum.textColor = RGB(177, 108, 56);
        _RightCornerPointNum.font = [UIFont fontWithSize:10];
        _RightCornerPointNum.text = @"29999";
    }
    return _RightCornerPointNum;
}

/**< 右上角积分Icon*/
- (UIImageView *)RightCornerIcon{
    if (!_RightCornerIcon) {
        _RightCornerIcon = [[UIImageView alloc] init];
        _RightCornerIcon.image = [UIImage imageNamed:@"RecommendationIcon"];
    }
    return _RightCornerIcon;
}

/**< 右上角商品图片*/
- (UIImageView *)RightCornerProImage{
    if (!_RightCornerProImage) {
        _RightCornerProImage = [[UIImageView alloc] init];
        _RightCornerProImage.image = [UIImage imageNamed:@"pho_bg_2"];
        _RightCornerProImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _RightCornerProImage;
}

/**< 右下角部分*/
- (UIButton *)BottomRightCorner{
    if (!_BottomRightCorner) {
        _BottomRightCorner = [[UIButton alloc] init];
        _BottomRightCorner.backgroundColor = [UIColor whiteColor];
        [_BottomRightCorner addTarget:self action:@selector(ActionDo:) forControlEvents:UIControlEventTouchUpInside];
        _BottomRightCorner.tag = BottomRightCornerTag;
    }
    return _BottomRightCorner;
}

/**< 右下角积分商品名称*/
- (UILabel *)BottomRightCornerNameLabel{
    if (!_BottomRightCornerNameLabel) {
        _BottomRightCornerNameLabel = [[UILabel alloc] init];
        _BottomRightCornerNameLabel.textColor = RGB(34, 34, 34);
        _BottomRightCornerNameLabel.font = [UIFont fontWithSize:14];
        _BottomRightCornerNameLabel.text = @"细胞奇迹面膜";
    }
    return _BottomRightCornerNameLabel;
}

/**< 右下角商品兑换积分数*/
- (UILabel *)BottomRightCornerPointNum{
    if (!_BottomRightCornerPointNum) {
        _BottomRightCornerPointNum = [[UILabel alloc] init];
        _BottomRightCornerPointNum.textColor = RGB(177, 108, 56);
        _BottomRightCornerPointNum.font = [UIFont fontWithSize:10];
        _BottomRightCornerPointNum.text = @"29999";
    }
    return _BottomRightCornerPointNum;
}

/**< 右下角积分Icon*/
- (UIImageView *)BottomRightCornerIcon{
    if (!_BottomRightCornerIcon) {
        _BottomRightCornerIcon = [[UIImageView alloc] init];
        _BottomRightCornerIcon.image = [UIImage imageNamed:@"RecommendationIcon"];
    }
    return _BottomRightCornerIcon;
}

/**< 右下角商品图片*/
- (UIImageView *)BottomRightCornerProImage{
    if (!_BottomRightCornerProImage) {
        _BottomRightCornerProImage = [[UIImageView alloc] init];
        _BottomRightCornerProImage.image = [UIImage imageNamed:@"pho_bg_2"];
        _BottomRightCornerProImage.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _BottomRightCornerProImage;
}


#pragma mark - 设置尺寸
- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    /**< 左侧部分部分*/
    [self.leftPart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@0);
        make.left.mas_equalTo(@0);
        make.width.mas_equalTo(@(self.width * 0.41));
        make.height.mas_equalTo(self.mas_height);
    }];
    
    /**< 左侧积分商品名称*/
    [self.leftPartNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftPart.mas_top).with.offset(13);
        make.left.mas_equalTo(self.leftPart.mas_left).with.offset(20);
    }];
    
    /**< 左侧商品兑换积分数*/
    [self.leftPartPointNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftPartNameLabel.mas_bottom).with.offset(9);
        make.left.mas_equalTo(self.leftPartNameLabel.mas_left);
    }];

    /**< 左侧积分Icon*/
    [self.leftPartIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftPartPointNum.mas_top);
        make.left.mas_equalTo(self.leftPartPointNum.mas_right).with.offset(3);
    }];

    /**< 左侧商品图片*/
    [self.leftPartProImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftPartIcon.mas_bottom).with.offset(7);
        make.left.mas_equalTo(self.leftPartPointNum.mas_left).with.offset(-10);
        make.right.mas_equalTo(self.leftPart.mas_right);
        make.bottom.mas_equalTo(self.leftPart.mas_bottom);
    }];
    
    /**< 右上角部分*/
    [self.RightCorner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.leftPart);
        make.left.mas_equalTo(self.leftPart.mas_right).with.offset(SINGLE_LINE_WIDTH);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(@((self.height - 1) * 0.5));
    }];
    
    /**< 右上角商品图片*/
    [self.RightCornerProImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.RightCorner.mas_top);
        make.left.mas_equalTo(self.RightCorner.mas_left);
        make.bottom.mas_equalTo(self.RightCorner.mas_bottom);
        make.width.mas_equalTo(self.RightCorner.mas_height);
    }];
    
    /**< 右上角积分商品名称*/
    [self.RightCornerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.RightCorner.mas_top).with.offset(22);
        make.left.mas_equalTo(self.RightCornerProImage.mas_right).with.offset(3);
    }];
    
    /**< 右上角商品兑换积分数*/
    [self.RightCornerPointNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.RightCornerNameLabel.mas_bottom).with.offset(9);
        make.left.mas_equalTo(self.RightCornerNameLabel.mas_left);
    }];
    
    /**< 右上角积分Icon*/
    [self.RightCornerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.RightCornerPointNum.mas_top);
        make.left.mas_equalTo(self.RightCornerPointNum.mas_right).with.offset(3);
    }];
    
    /**< 右下角部分*/
    [self.BottomRightCorner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.RightCorner.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.top.mas_equalTo(self.RightCorner.mas_bottom).with.offset(SINGLE_LINE_WIDTH);
        make.bottom.mas_equalTo(self.leftPart.mas_bottom);
    }];
    
    /**< 右下角商品图片*/
    [self.BottomRightCornerProImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BottomRightCorner.mas_top);
        make.width.mas_equalTo(self.BottomRightCorner.mas_height);
        make.right.mas_equalTo(self.BottomRightCorner.mas_right).with.offset(-5);
        make.bottom.mas_equalTo(self.BottomRightCorner.mas_bottom);
    }];
    
    /**< 右下角积分商品名称*/
    [self.BottomRightCornerNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BottomRightCorner.mas_top).with.offset(16);
        make.left.mas_equalTo(self.BottomRightCorner.mas_left).with.offset(8);
    }];
    
    /**< 右下角商品兑换积分数*/
    [self.BottomRightCornerPointNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.BottomRightCornerNameLabel.mas_bottom).with.offset(9);
        make.left.mas_equalTo(self.BottomRightCornerNameLabel.mas_left);
    }];
    
    /**< 右下角积分Icon*/
    [self.BottomRightCornerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.BottomRightCornerPointNum.mas_right).with.offset(3);
        make.top.mas_equalTo(self.BottomRightCornerPointNum.mas_top);
    }];
    
    
}

@end
