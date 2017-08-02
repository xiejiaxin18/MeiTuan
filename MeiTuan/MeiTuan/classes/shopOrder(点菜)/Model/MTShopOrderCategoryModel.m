//
//  MTShopOrderCategoryModel.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderCategoryModel.h"
#import "MTShopOrderFoodModel.h"


@implementation MTShopOrderCategoryModel

+ (instancetype)shopOrderCategoryWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


- (void)setSpus:(NSArray *)spus
{
    //创建可变数组用来保存当前这一组中所有的食物
    NSMutableArray *foodsArrM = [NSMutableArray arrayWithCapacity:spus.count];
    for (NSDictionary *foodDict in spus)
    {
        MTShopOrderFoodModel *foodModel = [MTShopOrderFoodModel shopOrderFoodWithDict:foodDict];
        [foodsArrM addObject:foodModel];
    }
    
    //赋值回去
    _spus = foodsArrM.copy;
    
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
