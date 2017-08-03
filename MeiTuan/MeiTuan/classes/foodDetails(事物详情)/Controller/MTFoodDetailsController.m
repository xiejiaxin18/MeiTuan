//
//  MTFoodDetailsController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodDetailsController.h"
#import "MTNavBar.h"

@interface MTFoodDetailsController ()

@end

@implementation MTFoodDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景色
    self.view.backgroundColor = [UIColor purpleColor];
    
    //让他导航条背景图片透明
    self.navBar.barImageView.alpha = 0;
    
    //设置返回箭头为白色
    self.navBar.tintColor = [UIColor whiteColor];
    
 
    
}


@end
