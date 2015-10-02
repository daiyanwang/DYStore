//
//  WaterflowLayout.m
//  WaterfallsFlow
//
//  Created by MyMac on 15/9/21.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "WaterflowLayout.h"

@interface WaterflowLayout ()

@property (nonatomic,strong) NSMutableDictionary *maxYdic;

@end

@implementation WaterflowLayout

-(NSMutableDictionary *)maxYdic
{
    if (!_maxYdic) {
        self.maxYdic = [[NSMutableDictionary alloc] init];
    }
    return _maxYdic;
}

-(instancetype)init
{
    if (self=[super init]) {
        self.columnMargin = 0;
        self.rowMargin = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.columnsCount = 1;
    }
    return self;
}
-(void)prepareLayout
{
    [super prepareLayout];
    
    
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(CGSize)collectionViewContentSize
{
    __block NSString * maxCol = @"0";
    //找出最短的列
    [self.maxYdic enumerateKeysAndObjectsUsingBlock:^(NSString * column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue]>[self.maxYdic[maxCol] floatValue]) {
            maxCol = column;
        }
    }];
    return CGSizeMake(0, [self.maxYdic[maxCol] floatValue]);
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __block NSString * minCol = @"0";
    //找出最短的列
    [self.maxYdic enumerateKeysAndObjectsUsingBlock:^(NSString * column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue]<[self.maxYdic[minCol] floatValue]) {
            minCol = column;
        }
    }];
    //    计算宽度
    CGFloat width = (self.collectionView.frame.size.width-self.sectionInset.left-self.sectionInset.right-(self.columnsCount-1)*self.columnMargin)/self.columnsCount;
    //    计算高度
    CGFloat hight = [self.delegate waterflowLayout:self heightForWidth:width atIndexPath:indexPath];
    
    CGFloat x = self.sectionInset.left + (width+ self.columnMargin)* [minCol intValue];
    CGFloat y =[self.maxYdic[minCol] floatValue]+self.rowMargin;
    //    跟新最大的y值
    self.maxYdic[minCol] = @(y+hight);
    
    //    计算位置
    UICollectionViewLayoutAttributes * attri =[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attri.frame = CGRectMake(x, y, width, hight);
    return attri;
    
    
    
    
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    for(int i = 0;i<self.columnsCount;i++)
    {
        NSString * col = [NSString stringWithFormat:@"%d",i];
        self.maxYdic[col] = @0;
    }
    
    
    NSMutableArray * array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        UICollectionViewLayoutAttributes * attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return  array;
}


@end
