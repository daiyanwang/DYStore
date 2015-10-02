//
//  PointsMallController.m
//  DYStore
//
//  Created by MyMac on 15/9/25.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "PointsMallController.h"
#import "PointNum.h" //积分和兑换积分部分
#import "RecommendationPart.h" //积分兑换推荐区
#import "PointsArea.h" //积分等级区
#import "PointMallCell.h" //底部cell
#import "WaterflowLayout.h"

static NSString *pointMall = @"pointMall";

@interface PointsMallController ()<PointsAreaDelegate,UICollectionViewDataSource,UICollectionViewDelegate,WaterflowLayoutDelegate,RecommendationPartDelegate,PointNumDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;

@property (nonatomic,strong) CycleScrollView *cycleScrollView; /**< 轮播图*/
@property (nonatomic,strong) PointNum *pointNum; /**< 积分和积分兑换部分*/
@property (nonatomic,strong) RecommendationPart *recommendation; /**< 积分兑换推荐区*/
@property (nonatomic,strong) PointsArea *pointArea; /**< 积分等级区*/

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) WaterflowLayout *flowLayout;
@property (nonatomic,assign) CGFloat flowLayoutHeight;

//@property (nonatomic,strong) NSArray *pointMallCount;


@end

@implementation PointsMallController

/**
 *  statusBar变为白色
 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGB(235, 235, 235);
    
    [self addViews];
    
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    
    
    self.cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    
    
    
}

/**
 *  添加视图控件
 */
- (void)addViews{
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.cycleScrollView];
    [self.scrollView addSubview:self.pointNum];
    [self.scrollView addSubview:self.recommendation];
    [self.scrollView addSubview:self.pointArea];
    [self.scrollView addSubview:self.collectionView];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.0001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGFloat height = 3 * self.flowLayoutHeight + 2 * SINGLE_LINE_WIDTH;
        self.collectionView.height = height;
        self.scrollView.contentSize = CGSizeMake(mainScreenW, self.collectionView.bottom + 5 * SINGLE_LINE_WIDTH);
    });

    
}

#pragma mark - PointNumDelegate 积分和兑换积分部分代理
- (void)pointNum:(PointNum *)pointNum DidClickedButton:(UIButton *)button{
    if (button.tag == leftButtonTag) {
        DBLog(@"leftButton===积分");
    }else if(button.tag == rightButtonTag){
        DBLog(@"rightButton===兑换积分");
    }
}

#pragma mark - RecommendationPartDelegate 积分推荐兑换区代理
- (void)recommendationPart:(RecommendationPart *)recommendationPart DidClickedButton:(UIButton *)button{
    if (button.tag == leftPartTag) {
        DBLog(@"leftPart===左侧");
    }else if (button.tag == RightCornerTag){
        DBLog(@"RightCorner===右上角");
    }else if (button.tag == BottomRightCornerTag){
        DBLog(@"BottomRightCorner===右下角");
    }
}


#pragma mark - PointsAreaDelegate 积分等级区代理
- (void)pointsArea:(PointsArea *)pointsArea DidClickedButton:(UIButton *)button{
    if (button.tag == PointsArea_500) {
        DBLog(@"500积分区");
    }else if (button.tag == PointsArea_1000){
        DBLog(@"1000积分区");
    }else if (button.tag == PointsArea_2000){
        DBLog(@"2000积分区");
    }else if (button.tag == PointsArea_5000){
        DBLog(@"5000积分区");
    }
}

#pragma mark - WaterflowLayoutDelegate
- (CGFloat)waterflowLayout:(WaterflowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath{
    self.flowLayoutHeight = width * 0.624;
//    DBLog(@"%f",self.flowLayoutHeight);
    return self.flowLayoutHeight;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PointMallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pointMall forIndexPath:indexPath];
//    cell.lists = self.figureShows[indexPath.row];
    return cell;
    
}


#pragma mark - getter and setter
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.x = 0;
        _scrollView.y = 0;
        _scrollView.width = mainScreenW;
        _scrollView.height = mainScreenH;
    }
    return _scrollView;
}

/**< 轮播图*/
- (CycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [[CycleScrollView alloc] init];
        _cycleScrollView.x = 0;
        _cycleScrollView.y = 0;
        _cycleScrollView.width = mainScreenW;
        _cycleScrollView.height = mainScreenW * 0.34;
        _cycleScrollView.pageControlAliment = CycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.dotColor = [UIColor whiteColor];
        _cycleScrollView.indicatorDotColor = RGB(198, 169, 142);
        _cycleScrollView.pageControlStyle = CycleScrollViewPageContolStyleClassic;
        _cycleScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
    }
    return _cycleScrollView;
}

/**< 积分和积分兑换部分*/
- (PointNum *)pointNum{
    if (!_pointNum) {
        _pointNum = [[PointNum alloc] init];
        _pointNum.x = 0;
        _pointNum.y = self.cycleScrollView.bottom;
        _pointNum.width = mainScreenW;
        _pointNum.height = mainScreenW * 0.08;
        _pointNum.delegate = self;
    }
    return _pointNum;
}

/**< 积分兑换推荐区*/
- (RecommendationPart *)recommendation{
    if (!_recommendation) {
        _recommendation = [[RecommendationPart alloc] init];
        _recommendation.x = 0;
        _recommendation.y = self.pointNum.bottom + 5 * SINGLE_LINE_WIDTH;
        _recommendation.width = mainScreenW;
        _recommendation.height = 164;
        _recommendation.delegate = self;
    }
    return _recommendation;
}

/**< 积分等级区*/
- (PointsArea *)pointArea{
    if (!_pointArea) {
        _pointArea = [[PointsArea alloc] init];
        _pointArea.delegate = self;
        _pointArea.x = 0;
        _pointArea.y = self.recommendation.bottom + 5 * SINGLE_LINE_WIDTH;
        _pointArea.width = mainScreenW;
        _pointArea.height = 107;
    }
    return _pointArea;
}

- (WaterflowLayout *)flowLayout{
    if (!_flowLayout) {
        _flowLayout = [[WaterflowLayout alloc] init];
        _flowLayout.rowMargin = SINGLE_LINE_WIDTH;
        _flowLayout.columnMargin = SINGLE_LINE_WIDTH;
        _flowLayout.columnsCount = 2;
        _flowLayout.delegate = self;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.pointArea.bottom + 5 * SINGLE_LINE_WIDTH, mainScreenW, 200) collectionViewLayout:self.flowLayout];
        [_collectionView registerClass:[PointMallCell class] forCellWithReuseIdentifier:pointMall];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = RGB(235, 235, 235);
    }
    return _collectionView;
}


@end
