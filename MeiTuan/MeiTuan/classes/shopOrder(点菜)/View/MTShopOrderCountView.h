//
//  MTShopOrderCountView.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTShopOrderFoodModel;

@interface MTShopOrderCountView : UIView

@property (nonatomic, strong) MTShopOrderFoodModel *foodModel;

+ (instancetype)shopOrderCountView;

@end
