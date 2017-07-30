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
        UINavigationBar *navigationBar = [[UINavigationBar alloc] init];
        
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    if (self.isViewLoaded && self.view.window == nil) {
        
        self.view = nil;
    }
}



@end
