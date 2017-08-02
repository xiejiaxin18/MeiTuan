//
//  MTShopDetailController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopDetailController.h"
#import "MTPOI_infoModel.h"
#import "MTInfoModel.h"
#import "MTinfoView.h"

#define KMargin  16 // 间距

@interface MTShopDetailController ()

@end

@implementation MTShopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


#pragma mark - 搭建界面
- (void)setupUI
{
    // TODO:添加背景图片
    UIImageView *bgImageView = [[UIImageView alloc] init];
    [bgImageView sd_setImageWithURL:[NSURL URLWithString:[_PoInfoModel.poi_back_pic_url stringByDeletingPathExtension]]];
    [self.view addSubview:bgImageView];
    
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
    
    // TODO: 添加关闭按钮
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
    [closeBtn setImage:[UIImage imageNamed:@"btn_close_selected"] forState:UIControlStateHighlighted];
    [self.view addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-60);
    }];
    
    [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // TODO:添加滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    //    scrollView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.bottom.equalTo(closeBtn.mas_top).offset(-60);
    }];
    
    
    // TODO:创建一个UIView用来包装scrollView中的所有子控件.为了方便约束
    UIView *contentView = [[UIView alloc] init];
    
    // 把容器视图添加到scrollView中
    [scrollView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
        make.width.equalTo(scrollView);
    }];
    
    [self setWithView:contentView];
}

#pragma mark - 滚动视图中的子控件
- (void)setWithView:(UIView *)contentView
{
    // TODO: 店名
    UILabel *shopNameLabel = [UILabel makeLabelWithText:_PoInfoModel.name andTextFont:14 andTextColor:[UIColor whiteColor]];
    
    [contentView addSubview:shopNameLabel];
    
    [shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.offset(64);
    }];
    
    
    // TODO: 起送价及配送
    UILabel *shopTipLabel = [UILabel makeLabelWithText:[NSString stringWithFormat:@"%@ | %@ | %@", _PoInfoModel.min_price_tip, _PoInfoModel.shipping_fee_tip, _PoInfoModel.delivery_time_tip] andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [contentView addSubview:shopTipLabel];
    
    [shopTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopNameLabel.mas_bottom).offset(KMargin * 0.5);
    }];
    
    // TODO: 折扣信息
    UILabel *shopDiscountLabel = [UILabel makeLabelWithText:@"折扣信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopDiscountLabel];
    
    [shopDiscountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(shopTipLabel.mas_bottom).offset(KMargin * 2.5);
    }];
    
    // TODO: 折扣信息两边的线
    UIView *shopDiscountLineViewLeft = [[UIView alloc] init];
    shopDiscountLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewLeft];
    
    [shopDiscountLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.height.offset(1);
        make.right.equalTo(shopDiscountLabel.mas_left).offset(-KMargin);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    
    
    UIView *shopDiscountLineViewRight = [[UIView alloc] init];
    shopDiscountLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopDiscountLineViewRight];
    
    [shopDiscountLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-KMargin);
        make.height.offset(1);
        make.left.equalTo(shopDiscountLabel.mas_right).offset(KMargin);
        make.centerY.equalTo(shopDiscountLabel).offset(0);
    }];
    
    
    
    // TODO:优惠信息
    UIStackView *stackView = [[UIStackView alloc] init];
    
    // 设置轴向
    stackView.axis = UILayoutConstraintAxisVertical;
    // 设置分布方式 等分填充
    stackView.distribution = UIStackViewDistributionFillEqually;
    // 间距每一个之间的间距
    stackView.spacing = 10;
    

    // 根据优惠信息的模型个数for循环创建infoView
    for (MTInfoModel *infoModel in _PoInfoModel.discounts2)
    {
        
        MTinfoView *infoView = [[MTinfoView alloc] init];
        
        
        infoView.infoModel = infoModel;
        // 不要用addSubView方法
        [stackView addArrangedSubview:infoView];
    }
    
    [contentView addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.right.offset(-KMargin);
        make.top.equalTo(shopDiscountLabel.mas_bottom).offset(KMargin);
        make.height.offset(_PoInfoModel.discounts2.count * 30);
    }];
    
    
    
    // TODO: 折扣信息
    UILabel *shopBulletinLabel = [UILabel makeLabelWithText:@"公告信息" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [contentView addSubview:shopBulletinLabel];
    
    [shopBulletinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.top.equalTo(stackView.mas_bottom).offset(KMargin * 2.5);
    }];
    
    
    
    
    // TODO: 折扣信息两边的线
    UIView *shopBulletinLineViewLeft = [[UIView alloc] init];
    shopBulletinLineViewLeft.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewLeft];
    
    [shopBulletinLineViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.height.offset(1);
        make.right.equalTo(shopBulletinLabel.mas_left).offset(-KMargin);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    
    UIView *shopBulletinLineViewRight = [[UIView alloc] init];
    shopBulletinLineViewRight.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:shopBulletinLineViewRight];
    
    [shopBulletinLineViewRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-KMargin);
        make.height.offset(1);
        make.left.equalTo(shopBulletinLabel.mas_right).offset(KMargin);
        make.centerY.equalTo(shopBulletinLabel).offset(0);
    }];
    
    
    // TODO: 商家公告信息
    
    UILabel *shopBulletionInfoLabel = [UILabel makeLabelWithText:_PoInfoModel.bulletin andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [contentView addSubview:shopBulletionInfoLabel];
    
    shopBulletionInfoLabel.numberOfLines = 0;
    
    //约束
    [shopBulletionInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(KMargin);
        make.top.equalTo(shopBulletinLabel.mas_bottom).offset(KMargin);
        make.right.offset(-KMargin);
        make.bottom.offset(-KMargin);
    }];

}

#pragma mark - 关闭按钮调用的方法
- (void)closeBtnClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - 设置状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end
