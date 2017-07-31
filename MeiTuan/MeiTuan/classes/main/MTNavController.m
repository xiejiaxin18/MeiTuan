//
//  MTNavController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTNavController.h"
#import "MTBaseController.h"

@interface MTNavController ()

@end

@implementation MTNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏掉navigationBar  hidden 隐藏的
    self.navigationBar.hidden = YES;
    
}

#pragma mark - 重写导航控制器的push按钮方法 给他设置返回按钮
- (void)pushViewController:(MTBaseController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    //判断是不是根控制器
    if (self.childViewControllers.count > 1)
    {
        //给push出来的viewC设置返回按钮 因为我们要用自己的所以改他的类名
        viewController.navItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_backItem" ] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    }
}

// 实现此方法让子控制器去设置状态栏的样式
- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma makr - 返回的按钮的方法
- (void)back
{
    //就直接pop掉
    [self popViewControllerAnimated:YES];
}
@end
