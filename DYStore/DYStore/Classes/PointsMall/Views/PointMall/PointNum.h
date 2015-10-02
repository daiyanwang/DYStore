//
//  PointNum.h
//  DYStore
//
//  Created by MyMac on 15/9/28.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分和兑换积分部分

#import <UIKit/UIKit.h>

@class PointNum;
@protocol PointNumDelegate <NSObject>

@optional
- (void)pointNum:(PointNum *)pointNum DidClickedButton:(UIButton *)button;

@end

@interface PointNum : UIView

@property (nonatomic,strong) UILabel *pointNumLabel; /**< 积分数量*/

@property (nonatomic,weak) id<PointNumDelegate> delegate;

@end
