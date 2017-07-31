//
//  MTBaseController.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/30.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTBaseController.h"

@interface MTBaseController ()

@end

@implementation MTBaseController

- (void)viewDidLoad {
   
    
}
#pragma mark - 重写控制器的创建方法
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        
        [super viewDidLoad];
        //创建导航控制条
        MTNavBar *navigationBar = [[MTNavBar alloc] init];
        
        //创建item
        UINavigationItem *item = [[UINavigationItem alloc] init];
        [navigationBar setItems:@[item]];
        
        _navItem = item;
        _navBar = navigationBar;
        
        [self.view addSubview:navigationBar];
        
        //添加约束
        [navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.offset(64);
        }];
    }
    
    return self;
}

//处理内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.isViewLoaded && self.view.window == nil) {
        
        self.view = nil;
    }
}

// 重写此属性的set方法,此方法调用说明有人想要换状态栏
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    
    // 让设置状态栏样式的方法重新调用
    [self setNeedsStatusBarAppearanceUpdate];
}

// 设置状态栏式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.statusBarStyle;
}



@end
