//
//  MTShopCarView.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/7.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTShopCarModel;

@interface MTShopCarView : UIView
//购物车模型
@property (nonatomic, strong) MTShopCarModel *shopCarModel;

+ (instancetype)shopCarView;

- (void)animWithStartPoint:(CGPoint)startPoint;
@end
