//
//  MTShopOrderCountView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderCountView.h"

@implementation MTShopOrderCountView

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
    
}

#pragma mark - 更新状态
- (void)updateState
{
    
}

-(void)setFoodModel:(MTShopOrderFoodModel *)foodModel
{
    _foodModel = foodModel;
    [self updateState];
}
@end
