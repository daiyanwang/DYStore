//
//  PointsArea.h
//  DYStore
//
//  Created by MyMac on 15/9/29.
//  Copyright © 2015年 MyMac. All rights reserved.
//  积分等级区

#import <UIKit/UIKit.h>

@class PointsArea;
@protocol PointsAreaDelegate <NSObject>

@optional
- (void)pointsArea:(PointsArea *)pointsArea DidClickedButton:(UIButton *)button;

@end

@interface PointsArea : UIView

@property (nonatomic,weak) id<PointsAreaDelegate> delegate;

@end
