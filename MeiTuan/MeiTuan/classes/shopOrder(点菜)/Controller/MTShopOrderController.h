//
//  MTShopOrderController.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTShopOrderCategoryModel;

@interface MTShopOrderController : UIViewController

//模型数据
@property (nonatomic, strong) NSArray<MTShopOrderCategoryModel *> *categoryData;

//表格视图的数组
@property (nonatomic, strong) NSArray *tableViewArr;
@end
