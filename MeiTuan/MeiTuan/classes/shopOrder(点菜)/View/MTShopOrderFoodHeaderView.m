//
//  MTShopOrderFoodHeaderView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderFoodHeaderView.h"

@implementation MTShopOrderFoodHeaderView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:(NSString *)reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    //延迟两秒
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.textColor = [UIColor blackColor];
            });
}

-(void)setName:(NSString *)name
{
    _name = name;
    self.textLabel.text = name;
}
@end
