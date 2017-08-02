//
//  MTShopOrderCategoryModel.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTShopOrderFoodModel;


@interface MTShopOrderCategoryModel : NSObject

//食物类名
@property (nonatomic, copy) NSString *name;

/// 保存当前类别的所有食物
@property (nonatomic, strong) NSArray<MTShopOrderFoodModel *> *spus;

+ (instancetype)shopOrderCategoryWithDict:(NSDictionary *)dict;
@end
