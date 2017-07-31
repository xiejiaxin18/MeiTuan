//
//  MTNavBar.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTNavBar.h"

@implementation MTNavBar

//重写创建方法改他的样式

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //先让他透明用我们自己的背景
        //设置阴影
        [self setShadowImage:[UIImage new]];
        
        //背景图
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        //创建一个图片来当背景
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_navigationBar_white"]];
        
        [self addSubview:imageView];
        
        //添加约束  edges:边界
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        
        _barImageView = imageView;
        
    }
    return self;
}
@end
