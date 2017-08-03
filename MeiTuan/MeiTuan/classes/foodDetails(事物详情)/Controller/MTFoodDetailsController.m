//
//  MTFoodDetailsController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodDetailsController.h"
#import "MTNavBar.h"
#import "MTFoodDetailsFlowLayout.h"
#import "MTShopOrderCategoryModel.h"
#import "MTFoodDetailsCell.h"

static NSString *foodDetailsCellID = @"foodDetailsCellID";

@interface MTFoodDetailsController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation MTFoodDetailsController

- (void)viewDidLoad {
    [self setupUI];

    [super viewDidLoad];
    
    //设置背景色
    self.view.backgroundColor = [UIColor purpleColor];
    
    //让他导航条背景图片透明
    self.navBar.barImageView.alpha = 0;
    
    //设置返回箭头为白色
    self.navBar.tintColor = [UIColor whiteColor];
    
    //不让系统内缩
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

#pragma mark - 搭建界面
- (void)setupUI
{
    //创建布局对象
    MTFoodDetailsFlowLayout *foodDetailsFlowLayout = [[MTFoodDetailsFlowLayout alloc] init];
    
    //创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:foodDetailsFlowLayout];
    [self.view addSubview:collectionView];
    
    //布局
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    //关闭滚动条
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    //关闭弹簧效果
    collectionView.bounces = NO;
    
    //开启分页
    collectionView.pagingEnabled = YES;
    
    //设置代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"MTFoodDetailsCell" bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:foodDetailsCellID];

    collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 数据源方法
//返回组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _foodData.count;
}

//返回行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //食物模型的个数就是当前行的
    return _foodData[section].spus.count;
}

//返回cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MTFoodDetailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:foodDetailsCellID forIndexPath:indexPath];
    
    cell.foodModel = _foodData[indexPath.section].spus[indexPath.row];
    
    return cell;
}

@end
