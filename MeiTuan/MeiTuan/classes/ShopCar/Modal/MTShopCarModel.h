//
//  MTShopCarModel.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/7.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTShopOrderFoodModel;
@interface MTShopCarModel : NSObject

//保存所有选购的食物模型
@property (nonatomic, strong) NSMutableArray<MTShopOrderFoodModel *> *foodModelArray;

@end
