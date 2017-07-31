//
//  MTFoodController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodController.h"
#import "MTFoodDetailsController.h"
#import "MTNavBar.h"
//定义宏来保存范围
#define KHeadViewMaxHeight 180
#define KHeadViewMinHeight 64


@interface MTFoodController ()

//头部view
@property (nonatomic, weak) UIView *headView;

//分享按钮
@property (nonatomic, strong) UIBarButtonItem *rightButton;

//标签
@property (nonatomic, weak) UIView *tagView;


@end

@implementation MTFoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

    
    //设置颜色
    self.view.backgroundColor = [UIColor blueColor];
    
    //默认设置
    [self settingNormal];

}

#pragma mark - 搭建界面
- (void)setupUI
{
    // TODO: 创建和添加头部视图
    [self settingHeadView];
    
    // TODO: 添加标签栏
    [self settingTagView];
    
    // TODO: 添加滚动视图
    [self settingScrollView];
    
}
#pragma mark - 添加头部视图
- (void)settingHeadView
{
    //创建头部的大view
    UIView *headView = [[UIView alloc] init];
    
    headView.backgroundColor = [UIColor redColor];
    
    //添加 约束
    [self.view addSubview:headView];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
        make.height.offset(180);
    }];
    
    //添加到属性
    _headView = headView;
}

#pragma mark - 标签栏
- (void)settingTagView
{
    //创建
    UIView *tagView = [[UIView alloc] init];
    tagView.backgroundColor = [UIColor whiteColor];
    
    //约束
    [self.view addSubview:tagView];
    
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView).offset(0);
        make.left.right.offset(0);
        make.height.offset(44);
    }];
    
    _tagView = tagView;
}

#pragma mark - 创建滚动视图
- (void)settingScrollView
{
    //创建
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    //添加约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(0);
        make.left.bottom.right.offset(0);
    }];
}

#pragma mark - 默认设置
- (void)settingNormal
{
    //设置标题
    self.navItem.title = @"香河肉饼";
    
    
    // 设置导航条标题文字颜色 为完全透明
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:0]};
    
    // 默认导航条的背景图片完全透明
    self.navBar.barImageView.alpha = 0;
    
    // 设置导航条右边分享按钮
    _rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_share"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navItem.rightBarButtonItem = _rightButton;
    self.navBar.tintColor = [UIColor whiteColor];
    
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
    
    //计算他的当前返回然后设置透明度
    // 计算导航条背景图片的透明度
    CGFloat alpha = [@(headViewHeight)resultWithValue1:HMValueMake(64, 1) andValue2:HMValueMake(180, 0)];
    
    self.navBar.barImageView.alpha = alpha;
    
    // 设置导航条标题文字颜色和导航条背景变化是一样的
    self.navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor colorWithWhite:0.4 alpha:alpha]};
    
    // 计算分享按钮的白色值
    CGFloat White = [@(headViewHeight) resultWithValue1:HMValueMake(64, 0.4) andValue2:HMValueMake(180, 1)];
    
    // 设置分类按钮的颜色
    self.navBar.tintColor = [UIColor colorWithWhite:White alpha:1];
    
    
    // 如果当前是180高度就用白色状态栏,反至用黑色
    if (headViewHeight == KHeadViewMaxHeight && self.statusBarStyle != UIStatusBarStyleLightContent) {
        
        self.statusBarStyle = UIStatusBarStyleLightContent;
        
    } else if (headViewHeight == KHeadViewMinHeight && self.statusBarStyle != UIStatusBarStyleDefault){
        self.statusBarStyle = UIStatusBarStyleDefault;
    }

    
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
