//
//  MTBaseController.h
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTBaseController : UIViewController

//储存导航条属性
@property (nonatomic, strong , readonly) UINavigationBar *navBar;

//储存导航条模型属性
@property (nonatomic, strong , readonly) UINavigationItem *navItem;
@end
