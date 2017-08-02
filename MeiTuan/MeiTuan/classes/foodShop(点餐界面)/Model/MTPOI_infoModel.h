//
//  MTPOI_infoModel.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MTInfoModel;

@interface MTPOI_infoModel : NSObject

/// 头部背景图片
@property (nonatomic, copy) NSString *poi_back_pic_url;

/// 头像
@property (nonatomic, copy) NSString *pic_url;

/// 店名
@property (nonatomic, copy) NSString *name;

/// 商家公告
@property (nonatomic, copy) NSString *bulletin;

/// 轮播广告
@property (nonatomic, strong) NSArray *discounts2;

/// 起送价
@property (nonatomic, copy) NSString *min_price_tip;

/// 配送费
@property (nonatomic, copy) NSString *shipping_fee_tip;

/// 配送时间
@property (nonatomic, copy) NSString *delivery_time_tip;

//创建类方法
+ (instancetype)POI_infoWithDict:(NSDictionary *)dict;
@end
