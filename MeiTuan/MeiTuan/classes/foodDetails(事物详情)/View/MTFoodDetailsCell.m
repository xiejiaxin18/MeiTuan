//
//  MTFoodDetailsCell.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodDetailsCell.h"
#import "MTShopOrderFoodModel.h"

@interface MTFoodDetailsCell ()<UIScrollViewDelegate>
//配图
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

//食物名称
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//月销售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;

//价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

//详情
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//好评率
@property (weak, nonatomic) IBOutlet UILabel *percentageLabel;

//好评条
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

//滚动条
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//商品信息
@property (weak, nonatomic) IBOutlet UILabel *shopInfoLabel;

//商品评价的顶部约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shopCommentTopConstraint;

@end
@implementation MTFoodDetailsCell

//重写模型的set方法
- (void)setFoodModel:(MTShopOrderFoodModel *)foodModel
{
    _foodModel = foodModel;
    
    //配图
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:[foodModel.picture stringByDeletingPathExtension]]];
    
    //食物名称
    _nameLabel.text = foodModel.name;
    
    //月销售
    _month_saled_contentLabel.text = foodModel.month_saled_content;
    
    //价格
    _min_priceLabel.text = [@"¥ " stringByAppendingFormat:@"%@", @(foodModel.min_price)];
    
    //详情
    _descLabel.text = foodModel.desc;
    
    //没有食物详情就隐藏商品信息label
    
    BOOL isDescContent =[foodModel.desc stringByReplacingOccurrencesOfString:@" " withString:@""].length;
    
    _shopInfoLabel.hidden = !isDescContent;
    
    //更改约束
    _shopCommentTopConstraint.constant = (isDescContent == YES) ? 8 : -24;
    
    //好评率
    //计算
    //判断他是不是0
    CGFloat percentage = (foodModel.praise_num) ? (foodModel.praise_num / (foodModel.praise_num + foodModel.tread_num)) : 0 ;
    
    
    _percentageLabel.text = [NSString stringWithFormat:@"%.f%%", percentage * 100];

    //进度
    _progressView.progress = percentage;
    
    _scrollView.delegate = self;
}
#pragma mark - 监听滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取滚动的距离
    CGFloat offsety = scrollView.contentOffset.y;
    
    //判断是不是向下拖拽
    if (offsety < 0)
    {
        //计算 移动的比例
        CGFloat scale = [@(offsety) resultWithValue1:MTValueMake(0, 1) andValue2:MTValueMake(-240, 2)];
        
        //创建原始移动值
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        //先平移
        transform = CGAffineTransformTranslate(transform, 0, offsety* 0.5);
        
        //在缩放
        transform = CGAffineTransformScale(transform, scale, scale);
        
        
        _pictureView.transform = transform;
    }
    else
    {
    _pictureView.transform = CGAffineTransformIdentity;
    }
    
}

@end
