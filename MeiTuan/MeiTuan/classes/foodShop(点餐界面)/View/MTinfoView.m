//
//  MTinfoView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTinfoView.h"
#import "MTInfoModel.h"

@interface MTinfoView ()

//小图标
@property (nonatomic, weak) UIImageView *iconView;
//滚动消息
@property (nonatomic, weak) UILabel *infoLabel;

@end

@implementation MTinfoView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    //小图标
    UIImageView *iconView = [[UIImageView alloc]init];
    [self addSubview: iconView];
    
    //添加约束
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.width.equalTo(iconView.mas_height);
    }];
    _iconView = iconView;
    
    //消息标签
    UILabel *infoLabel = [UILabel makeLabelWithText:@"嘻嘻" andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    [self addSubview:infoLabel];
    
    //添加约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
//        make.right.offset(0);
        make.centerY.offset(0);
    }];
    _infoLabel = infoLabel;

}
- (void)setInfoModel:(MTInfoModel *)infoModel
{
    _infoModel = infoModel;
    
    [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        // 图标
        [_iconView sd_setImageWithURL:[NSURL URLWithString:infoModel.icon_url]];
        
        // 优惠信息
        _infoLabel.text = infoModel.info;
    } completion:nil];
}

@end
