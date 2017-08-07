//
//  MTShopOrderFoodCell.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTShopOrderFoodModel;
@class MTShopOrderCountView;

@interface MTShopOrderFoodCell : UITableViewCell

//定义属性接收模型数据
@property (nonatomic, strong) MTShopOrderFoodModel *foodModel;

//countview
@property (nonatomic, weak) MTShopOrderCountView *countView;
@end
