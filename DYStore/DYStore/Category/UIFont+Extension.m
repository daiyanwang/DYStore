//
//  UIFont+Extension.m
//  DYNet
//
//  Created by MyMac on 15/7/27.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "UIFont+Extension.h"

@implementation UIFont (Extension)

+ (UIFont *)fontWithSize:(float)size{
//    pt=(px/96)*72
    return [UIFont fontWithName:@"HiraginoSans-W3" size:size];
}

@end
