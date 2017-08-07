//
//  MTShopOrderCountView.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义枚举储存是加号还是减号
typedef enum : NSUInteger {
    MTShopOrderCountViewBtnTypeAdd,
    MTShopOrderCountViewBtnTypeMinus
} MTShopOrderCountViewBtnType;

@class MTShopOrderFoodModel,MTShopOrderCountView;

//创建协议
@protocol MTShopOrderCountViewDelegate <NSObject>

@optional
- (void)shopOrderCountViewValueChange:(MTShopOrderCountView *)countView;

@end

@interface MTShopOrderCountView : UIView

//加号按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//类型
@property (nonatomic, assign)MTShopOrderCountViewBtnType type;

//食物模型
@property (nonatomic, strong) MTShopOrderFoodModel *foodModel;

//协议
@property (nonatomic, weak) id<MTShopOrderCountViewDelegate> delegate;
+ (instancetype)shopOrderCountView;

@end
