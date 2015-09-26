//
//  NSDictionary+Value.h
//  DYStore
//
//  Created by MyMac on 15/8/12.
//  Copyright (c) 2015年 daiyanwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isKindOfNSDictionary(obj) (obj && ![obj isEqual:[NSNull null]] && [obj isKindOfClass:[NSDictionary class]])
#define isKindOfNSArray(obj)      (obj && ![obj isEqual:[NSNull null]] && [obj isKindOfClass:[NSArray class]])

@interface NSDictionary (Value)

- (NSString *)stringValueForKey:(id)aKey;
- (int)intValueForKey:(id)aKey;
- (float)floatValueForKey:(id)aKey;
- (double)doubleValueForKey:(id)aKey;
- (BOOL)boolValueForKey:(id)aKey;
- (NSInteger)integerValueForKey:(id)aKey;
- (long long)longLongValueForKey:(id)aKey;

@end
