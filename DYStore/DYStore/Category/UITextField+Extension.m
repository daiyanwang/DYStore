//
//  UITextField+Extension.m
//  DYStore
//
//  Created by MyMac on 15/8/3.
//  Copyright (c) 2015年 daiyanwang. All rights reserved.
//

#import "UITextField+Extension.h"
@implementation UITextField (Extension)

- (void)setAttrPlaceholder:(NSString *)placeholder fontSize:(CGFloat)fontSize {
    
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] init];
    attrs[NSFontAttributeName] = [UIFont fontWithSize:fontSize];
    attrs[NSForegroundColorAttributeName] = RGB(170, 170, 170);
    
    NSAttributedString *attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:attrs];
    [self setAttributedPlaceholder:attributedPlaceholder];
}



@end
