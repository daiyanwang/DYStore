//
//  Tag.h
//  DYStore
//
//  Created by MyMac on 15/10/2.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#ifndef Tag_h
#define Tag_h

//==========PointsMallController(积分商城首页)==================
#pragma mark - PointNum(积分和兑换积分部分)
typedef enum{
    leftButtonTag = 10,
    rightButtonTag = 11
} PointNumTag;


#pragma mark - RecommendationPart(积分兑换推荐区)
typedef enum{
    leftPartTag = 12,
    RightCornerTag = 13,
    BottomRightCornerTag = 14
    
} RecommendationPartTag;


#pragma mark - PointsArea(积分等级区)
typedef enum{
    PointsArea_500 = 15,
    PointsArea_1000 = 16,
    PointsArea_2000 = 17,
    PointsArea_5000 = 18,
} PointsAreaTag;

#endif /* Tag_h */
