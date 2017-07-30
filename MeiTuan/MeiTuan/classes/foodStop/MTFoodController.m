//
//  MTFoodController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodController.h"
#import "MTFoodDetailsController.h"
//定义宏来保存范围
#define KHeadViewMaxHeight 180
#define KHeadViewMinHeight 64


@interface MTFoodController ()
@property (nonatomic, weak) UIView *headView;

@end

@implementation MTFoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置颜色
    self.view.backgroundColor = [UIColor redColor];
    
    //给导航条设置背景色
    self.navBar.barTintColor = [UIColor blueColor];
    
    //设置标题
    self.navItem.title = @"香河肉饼";
    
    [self setupUI];
    
}

- (void)setupUI
{
    //创建头部的大view
    UIView *headView = [[UIView alloc] init];
    
    headView.backgroundColor = [UIColor purpleColor];
    
    //添加 约束
    [self.view addSubview:headView];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
        make.height.offset(180);
    }];
    
    //添加到属性
    _headView = headView;
    
    //添加平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    
    [self.view addGestureRecognizer:pan];
}

#pragma mark - 平移手势
- (void)panGesture:(UIPanGestureRecognizer *)pan
{
    //获取移动后的点
    CGPoint p = [pan translationInView:pan.view];
    
    //定义一个变量储存高度
    CGFloat headViewHeight = _headView.bounds.size.height;
    
    //设置约束  是更新约束!
    [_headView mas_updateConstraints:^(MASConstraintMaker *make)
     {
        //添加判断
        if (p.y + headViewHeight <= KHeadViewMinHeight) // 如果它移动后悔小于这个最小高度
        {
            //就让他等于最小高度
            make.height.offset(KHeadViewMinHeight);
        }
        else if (p.y + headViewHeight >= KHeadViewMaxHeight) //如果它移动后大于这个最大高度
        {
            make.height.offset(KHeadViewMaxHeight);
        }
        else
        {
            make.height.offset(p.y + headViewHeight);
        }

    }];
    
    //恢复初始值
    [pan setTranslation:CGPointZero inView:pan.view];
}
#pragma mark - 临时跳转
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    MTFoodDetailsController *foodDVC = [[MTFoodDetailsController alloc] init];
//    [self.navigationController pushViewController:foodDVC animated:YES];
//}
@end
