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
#import "MTShopComment.h"
#import "MTShopInfoController.h"
#import "MTShopOrderController.h"
#import "MTHeadView.h"
#import "MTPOI_infoModel.h"

//定义宏来保存范围
#define KHeadViewMaxHeight 180
#define KHeadViewMinHeight 64


@interface MTFoodController ()<UIScrollViewDelegate>

//头部view
@property (nonatomic, weak) MTHeadView *headView;

//分享按钮
@property (nonatomic, strong) UIBarButtonItem *rightButton;

//标签
@property (nonatomic, weak) UIView *tagView;

//第一个标签按钮
@property (nonatomic, weak) UIButton *fistBtn;

//小黄条
@property (nonatomic, weak) UIView *yellowView;

//滚动视图
@property (nonatomic, weak) UIScrollView *scrollView;

/// 头部模型数据
@property (nonatomic, strong) MTPOI_infoModel *POI_infoModel;

@end

@implementation MTFoodController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self loadDataWithJSON];
    
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
    MTHeadView *headView = [[MTHeadView alloc] init];
    
//    headView.backgroundColor = [UIColor redColor];
    
    //添加 约束
    [self.view addSubview:headView];
    
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.offset(0);
        make.height.offset(180);
    }];
    
    headView.POI_infoModel = _POI_infoModel;
    
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
        make.top.equalTo(self.headView.mas_bottom).offset(0);
        make.left.right.offset(0);
        make.height.offset(44);
    }];
    
    _tagView = tagView;
    
    //添加按钮
    _fistBtn = [self makeTagViewBtnWithTitle:@"点菜"];
    
    [self makeTagViewBtnWithTitle:@"评价"];
    
    [self makeTagViewBtnWithTitle:@"商家"];
    
    //添加他们的约束
    [tagView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
    }];
    
    [tagView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [self settingYellowView];
}

#pragma mark - 创建标签栏中的按钮
- (UIButton *)makeTagViewBtnWithTitle:(NSString *)title
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    
    //设置颜色
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
    // 给按钮添加监听事件
    [btn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 用标签视图子控件的个数来当按钮的tag
    btn.tag = _tagView.subviews.count;
    
    
    //设置字号
    btn.titleLabel.font = [UIFont systemFontOfSize:14];

    [_tagView addSubview:btn];
    
    return btn;
}

#pragma mark - 按钮标签栏中的按钮时调用此方法
- (void)tagBtnClick:(UIButton *)btn {
    
    // 动画的方法让scrollView中的内容滚动
    [_scrollView setContentOffset:CGPointMake(btn.tag * _scrollView.bounds.size.width, 0) animated:YES];
}

#pragma mark - 创建模拟指示条
- (void)settingYellowView
{
    UIView *Yellowview = [[UIView alloc] init];
    
    Yellowview.backgroundColor = [UIColor primaryYellowColor];
    [_tagView addSubview:Yellowview];
    
    //设置约束
    [Yellowview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(50);
        make.height.offset(4);
        make.bottom.offset(0);
        make.centerX.equalTo(_fistBtn).offset(0);
    }];
    _yellowView = Yellowview;
}

#pragma mark - 创建滚动视图
- (void)settingScrollView
{
    //创建
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    
    scrollView.delegate = self;
    
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    
    //添加约束
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagView.mas_bottom).offset(0);
        make.left.bottom.right.offset(0);
    }];
    
    //创建三个控制器
    MTShopComment *scvc = [[MTShopComment alloc] init];
    MTShopInfoController *ifvc = [[MTShopInfoController alloc] init];
    MTShopOrderController *odvc = [[MTShopOrderController alloc] init];
    
    NSArray *vcArr = @[scvc,ifvc,odvc];
    
    //循环遍历添加到scrollview中
    for (UIViewController *vc in vcArr)
    {
        //吧view添加进去
        [scrollView addSubview:vc.view];
        
        //建立父子控制器关系
        [self addChildViewController:vc];
        
        //告诉他
        [vc didMoveToParentViewController:self];
    }
    
    //设置约束
    [scrollView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        
        make.width.height.equalTo(scrollView);
    }];
    
    //同高同宽还并排显示
    [scrollView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    _scrollView = scrollView;
}

#pragma mark - 监听scrollView的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //算页数
    CGFloat page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //计算他一次走的距离
      CGFloat transformOnceX = _tagView.bounds.size.width / (_tagView.subviews.count - 1);
    
    //设置偏移
    _yellowView.transform = CGAffineTransformMakeTranslation(transformOnceX * page, 0);
    
    
    
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

#pragma mark - 手动拖拽滚动完全停下后来调用此方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 要整页数
    NSInteger page = scrollView.contentOffset.x / scrollView.bounds.size.width;
    // 遍历标签栏中的所有子控件
    for (NSInteger i = 0; i < _tagView.subviews.count - 1; i++) {
        
        // 获取子控件
        UIButton *btn = _tagView.subviews[i];
        
        
        // i == 页数 刚就就对应相的按钮
        if (page == i) { // 如果当前页数和按钮对应时,就把按钮中的文字字体加粗
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        } else { // 反之就把按钮的文字再恢复到不加粗
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
        }
        
    }
    
}

#pragma mark - 代码方法滚动并且有动画时,滚动完停来会调用此方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 手动去调用 手动拖拽停下来的方法,去更新字体
    [self scrollViewDidEndDecelerating:scrollView];
}

#pragma mark - 加载数据
- (void)loadDataWithJSON
{
    //加载json文件
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"food.json" withExtension:nil]];
    
    //转化成dict
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    NSDictionary *poi_info = jsonDict[@"data"][@"poi_info"];
    
    //字典转模型
    MTPOI_infoModel *model = [MTPOI_infoModel POI_infoWithDict:poi_info];
    
    _POI_infoModel = model;
}

@end
