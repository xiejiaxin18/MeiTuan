//
//  MTBaseController.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTNavBar.h"

@interface MTBaseController : UIViewController

//储存导航条属性
@property (nonatomic, strong , readonly) MTNavBar *navBar;

//储存导航条模型属性
@property (nonatomic, strong , readonly) UINavigationItem *navItem;

// 状态栏样式
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@end
