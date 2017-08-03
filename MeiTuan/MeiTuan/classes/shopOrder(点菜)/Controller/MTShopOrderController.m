//
//  MTShopOrderController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderController.h"
#import "MTShopOrderCategoryModel.h"
#import "MTShopOrderFoodModel.h"
#import "MTShopOrderCategoryCell.h"
#import "MTShopOrderFoodHeaderView.h"
#import "MTShopOrderFoodCell.h"
#import "MTFoodDetailsController.h"

//类型表格的重用ID
static NSString *categoryCellID = @"categoryCellID";

//食物表格的重用ID
static NSString *foodCellID = @"foodCellID";

//头部视图的重用ID
static NSString *foodHeaderViewID = @"foodHeaderViewID";

@interface MTShopOrderController ()<UITableViewDelegate, UITableViewDataSource>

//创建属性储存类型表格
@property (nonatomic, weak) UITableView *categoryTableView;

//储存食物属性
@property (nonatomic, weak) UITableView *foodTableView;

//记录是不是手动选中
@property (nonatomic, assign) BOOL categoryTbaleViewClick;
@end

@implementation MTShopOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


#pragma mark - 搭建界面
- (void)setupUI
{
    //类型表格
    [self settingCategoryTableView];
    
    //食物表格
    [self settingFoodTableView];
}

#pragma mark - 类型表格
- (void)settingCategoryTableView
{
    //创建tableView
    UITableView *categoryTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:categoryTableView];
    
    //添加约束
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.offset(100);
    }];
    
    //设置代理
    categoryTableView.delegate = self;
    categoryTableView.dataSource = self;
    
    //添加属性
    _categoryTableView = categoryTableView;
    
    //注册cell
    [categoryTableView registerClass:[MTShopOrderCategoryCell class] forCellReuseIdentifier:categoryCellID];
    
    //设置行高
    categoryTableView.rowHeight = 60;
    
    //隐藏分割线
    categoryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    //默认选中第0行
    [categoryTableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

#pragma mark - 食物表格
- (void)settingFoodTableView
{
    //创建tableView
    UITableView *foodTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:foodTableView];
    
    //添加约束
    [foodTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.offset(0);
        make.left.equalTo(_categoryTableView.mas_right).offset(0);
    }];
    
    //设置代理
    foodTableView.delegate = self;
    foodTableView.dataSource = self;
    
    //注册cell
    UINib *nib = [UINib nibWithNibName:@"MTShopOrderFoodCell" bundle:nil];
    [foodTableView registerNib:nib forCellReuseIdentifier:foodCellID];
    
    // 注册头部视图
    [foodTableView registerClass:[MTShopOrderFoodHeaderView class] forHeaderFooterViewReuseIdentifier:foodHeaderViewID];
    
    // 设置每一组的组头统一高度
    foodTableView.sectionHeaderHeight = 30;
    
    // 设置预估行高
    foodTableView.estimatedRowHeight = 150;
    
    _foodTableView = foodTableView;
}

#pragma mark - 实现数据源方法
//返回组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //判断是什么表格
    if (tableView == _categoryTableView)
    {
        return 1;
    }
    
    return _categoryData.count;
}

//返回行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //判断是什么表格
    if (tableView == _categoryTableView)
    {
        return _categoryData.count;
    }
    
    return _categoryData[section].spus.count;// 当前组有多少个食物就表示食物表格当前组有多少行
}

//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //判断是什么表格
    if (tableView == _categoryTableView)
    {
        MTShopOrderCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCellID forIndexPath:indexPath];
        
        //取出类别模型
        MTShopOrderCategoryModel *categoryModel = _categoryData[indexPath.row];
        
        //传数据
        cell.name= categoryModel.name;
        
        return cell;
        
    }

    MTShopOrderFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:foodCellID forIndexPath:indexPath];
    //先取出类别模型
    MTShopOrderCategoryModel *categoryModel = _categoryData[indexPath.section];
    
    //取出食物一个模型
    MTShopOrderFoodModel *foodModel = categoryModel.spus[indexPath.row];
    
    cell.foodModel = foodModel;
    
    return cell;
}

//返回头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    MTShopOrderFoodHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:foodHeaderViewID];
    
    headerView.name = _categoryData[section].name;
    
    return headerView;
}

#pragma mark - 选中cell就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是不是食物表格
    if (_foodTableView == tableView)
    {
        //取消选中
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        //创建食物详情控制器
        MTFoodDetailsController *foodDeatilVC = [[MTFoodDetailsController alloc] init];
        
        //传数据
        foodDeatilVC.foodData = _categoryData;
        
        //跳转
        [self.navigationController pushViewController:foodDeatilVC animated:YES];
        
    }
    //判断是不是类别表格
    if (_categoryTableView == tableView)
    {
        //用列表表格的所以来当食物表格组的索引的
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        
        //让食物列表滚动
        [_foodTableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        //设置是因为手动滚动
        _categoryTbaleViewClick = YES;
    }
}

#pragma mark - 监听滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //判断是不是foodTbaleView 还有判断是不是手动滚动
    if (_foodTableView == scrollView && _categoryTbaleViewClick == NO)
    {
        //获取当前foodTableView的索引
        //要是他当前显示的第一个的
        NSIndexPath *indexPath = [[_foodTableView indexPathsForVisibleRows] firstObject];
        
        //创建索引 取他的当前组 因为左边是一个组头
        NSIndexPath *selectIndexPath = [NSIndexPath indexPathForRow:indexPath.section inSection:0];
        
        [_categoryTableView selectRowAtIndexPath:selectIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        
    }
}

#pragma mark - 滚动结束的时候让手动滚动为NO
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    _categoryTbaleViewClick = NO;
}

@end
