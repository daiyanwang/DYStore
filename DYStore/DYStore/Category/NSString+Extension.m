//
//  NSString+Extension.m
//  DYStore
//
//  Created by MyMac on 15/9/25.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 *  计算文字的大小
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}



/**
 *  计算文字大小
 */
- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}

@end
