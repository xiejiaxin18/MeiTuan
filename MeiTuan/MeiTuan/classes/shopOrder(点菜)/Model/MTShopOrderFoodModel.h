//
//  MTShopOrderFoodModel.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTShopOrderFoodModel : NSObject

//食物名称
@property (nonatomic, copy) NSString *name;

+ (instancetype)shopOrderFoodWithDict:(NSDictionary *)dict;

@end
