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

//类型表格的重用ID
static NSString *categoryCellID = @"categoryCellID";

//食物表格的重用ID
static NSString *foodCellID = @"foodCellID";

@interface MTShopOrderController ()<UITableViewDelegate, UITableViewDataSource>

//创建属性储存类型表格
@property (nonatomic, weak) UITableView *categoryTableView;

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
    [foodTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:foodCellID];
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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:foodCellID forIndexPath:indexPath];
    //先取出类别模型
    MTShopOrderCategoryModel *categoryModel = _categoryData[indexPath.section];
    
    //取出食物一个模型
    MTShopOrderFoodModel *foodModel = categoryModel.spus[indexPath.row];
    
    cell.textLabel.text = foodModel.name;
    
    return cell;
}

@end
