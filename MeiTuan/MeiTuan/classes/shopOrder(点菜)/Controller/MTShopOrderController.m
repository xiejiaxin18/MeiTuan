//
//  MTShopOrderController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderController.h"

@interface MTShopOrderController ()

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
    
    _categoryTableView = categoryTableView;
    
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

}
@end
