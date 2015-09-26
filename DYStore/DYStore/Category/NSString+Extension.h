//
//  NSString+Extension.h
//  DYStore
//
//  Created by MyMac on 15/9/25.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

//计算文字的大小
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

//计算文字大小
- (CGSize)sizeWithFont:(UIFont *)font;

@end
