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

//月售
@property (nonatomic, copy) NSString *month_saled_content;

//图片
@property (nonatomic, copy) NSString *picture;

//详情说明
@property (nonatomic, copy) NSString *desc;

//赞
@property (nonatomic, copy) NSString *praise_content;

//价格
@property (nonatomic, assign) float min_price;

//差评
@property (nonatomic, assign) CGFloat tread_num;

//好评
@property (nonatomic, assign) CGFloat praise_num;

//记录当前食物的选购数量
@property (nonatomic, assign) NSInteger count;

+ (instancetype)shopOrderFoodWithDict:(NSDictionary *)dict;

@end
