//
//  main.m
//  测试
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])

{
    
    NSInteger a = 10;
    
    NSLog(@"%zd",a);
    
    NSInteger b = 0;
    
    NSLog(@"%zd",b);

    CGFloat c = 1.2;
    
    NSLog(@"%f",c);

    NSLog(@"==========================");

    a = !a;
    b = !b;
    c = !c;
    NSLog(@"%zd",a);
    NSLog(@"%zd",b);

    NSLog(@"%f",c);

}
