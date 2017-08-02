//
//  MTShopDetailAnimator.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopDetailAnimator.h"

typedef enum : NSUInteger {
    //显示
    MTShopDetailAnimatorTransitioningTypePresent,
    
    //结束
    MTShopDetailAnimatorTransitioningTypeDismiss,
    
} MTShopDetailAnimatorTransitioningType;


@interface MTShopDetailAnimator ()<UIViewControllerAnimatedTransitioning>

//定义属性储存他的转场方式
@property (nonatomic, assign) MTShopDetailAnimatorTransitioningType transitioningType;

@end

@implementation MTShopDetailAnimator

//modal调用 谁来处理modal及modal的动画
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    _transitioningType = MTShopDetailAnimatorTransitioningTypePresent;
    return self;
}

//dismiss调用  谁来处理
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    _transitioningType = MTShopDetailAnimatorTransitioningTypeDismiss;
    return self;
}

//返回转场动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

//都调用方法
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获取要去的界面
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    //获取来源界面
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //获取容器视图
    UIView *containerView = [transitionContext containerView];
    
    //判断他是去还是回来
    if (_transitioningType == MTShopDetailAnimatorTransitioningTypePresent)
    {
        //一开始是最小
        toView.transform = CGAffineTransformMakeScale(0, 0);
        
        //然后把界面添加到容器视图
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            
            //再显示出来
            toView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            //转场完成
            [transitionContext completeTransition:YES];
        }];
    }
    else //dis
    {
        [UIView animateWithDuration:[self transitionDuration:nil] animations:^{
            
            //让他动画的形式弄到最小.. 0会无效
            fromView.transform = CGAffineTransformMakeScale(0.01, 0.01);
            
        } completion:^(BOOL finished) {
            
            // 转场完成后告诉系统转场完成
            [transitionContext completeTransition:YES];
        }];
    }
    
}
@end
