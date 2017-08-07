//
//  MTShopCarModel.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/7.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopCarModel.h"

@implementation MTShopCarModel
- (NSMutableArray<MTShopOrderFoodModel *> *)foodModelArray {
    if (_foodModelArray == nil) {
        _foodModelArray = [NSMutableArray array];
    }
    return _foodModelArray;
}
@end
