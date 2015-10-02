//
//  RecommendationPart.h
//  DYStore
//
//  Created by MyMac on 15/9/28.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分兑换推荐区

#import <UIKit/UIKit.h>

@class RecommendationPart;
@protocol RecommendationPartDelegate <NSObject>

- (void)recommendationPart:(RecommendationPart *)recommendationPart DidClickedButton:(UIButton *)button;

@end

@interface RecommendationPart : UIView

@property (nonatomic,weak) id<RecommendationPartDelegate> delegate;

@end
