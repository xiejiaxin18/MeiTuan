//
//  MTShopOrderCategoryCell.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderCategoryCell.h"

@implementation MTShopOrderCategoryCell
-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    //行数
    self.textLabel.numberOfLines = 2;
    
    //字体
    self.textLabel.font = [UIFont systemFontOfSize:12];
    
    //背景颜色
    self.backgroundColor = [UIColor colorWithHex:0xefefef];
    
    //用背景视图的方式来添加虚线
    UIView *bgLineView = [[UIView alloc] init];
    bgLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor blackColor]]];
    self.backgroundView = bgLineView;
    
    [bgLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(1);
    }];

    
    //设置选中的视图样式
    UIView *selectedBgView = [UIView new];
    selectedBgView.backgroundColor = [UIColor whiteColor];
    
    self.selectedBackgroundView = selectedBgView;
    
    //小黄条
    UIView *lineYellowView = [UIView new];
    lineYellowView.backgroundColor = [UIColor primaryYellowColor];
    [selectedBgView addSubview:lineYellowView];
    
    //约束
    [lineYellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.offset(0);
        make.width.offset(4);
        make.height.offset(44);
    }];
    
}

//重写set方法
- (void)setName:(NSString *)name
{
    self.textLabel.text = name;

}
@end
