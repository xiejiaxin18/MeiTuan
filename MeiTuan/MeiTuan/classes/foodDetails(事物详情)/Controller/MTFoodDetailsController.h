//
//  MTFoodDetailsController.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//


#import "MTBaseController.h"
@class MTShopOrderCategoryModel;

@interface MTFoodDetailsController : MTBaseController

//所有的食物数据
@property (nonatomic, strong) NSArray <MTShopOrderCategoryModel *> *foodData;

@end
