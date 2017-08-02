//
//  loopView.m
//  MeiTuanCarryout
//
//  Created by JZG-users on 2017/8/1.
//  Copyright © 2017年 JZG-users. All rights reserved.
//

#import "loopView.h"
#import "Masonry.h"
#import "UILabel+Addition.h"
#import "UIImageView+WebCache.h"
#import "LoopViewModel.h"

@interface loopView ()

//小图标
@property (nonatomic, weak) UIImageView *iconView;
//滚动消息
@property (nonatomic, weak) UILabel *infoLabel;

//索引
@property (nonatomic, assign) NSInteger index;



@end

@implementation loopView


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
        make.left.centerY.offset(0);
        make.height.width.offset(20);
    }];
    _iconView = iconView;
    
    //消息标签
    UILabel *infoLabel = [UILabel makeLabelWithText:@"嘻嘻" andTextFont:12 andTextColor:[UIColor colorWithWhite:1 alpha:0.7]];
    [self addSubview:infoLabel];
    
    //添加约束
    [infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(8);
        make.right.offset(0);
        make.centerY.offset(0);
    }];
    _infoLabel = infoLabel;
    
    //添加无线循环
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    
    
}

#pragma mark - 设置动画
-(void)animation
{
    
    //创建动画
    [UIView transitionWithView:self duration:0.25 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        
        //计算下标
        _index = (_index + 7) % 7;
        
        //取出数据赋值
        NSURL *url = [NSURL URLWithString:_loopViewModel[_index].icon_url];
        [_iconView sd_setImageWithURL:url];
        
        _infoLabel.text = _loopViewModel[_index].info;
        
        _index++;
        
    } completion:nil];
    
    
    
}

#pragma mark - 给模型传数据的方法
-(void)setLoopViewModel:(NSArray<LoopViewModel *> *)loopViewModel{
    
    _loopViewModel = loopViewModel;
    NSURL *url = [NSURL URLWithString:loopViewModel[0].icon_url];
    [_iconView sd_setImageWithURL:url];
    
    _infoLabel.text = loopViewModel[0].info;
    
    [self animation];
}
@end
