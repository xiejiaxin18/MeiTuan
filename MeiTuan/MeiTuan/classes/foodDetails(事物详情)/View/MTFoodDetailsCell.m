//
//  MTFoodDetailsCell.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodDetailsCell.h"
#import "MTShopOrderFoodModel.h"

@interface MTFoodDetailsCell ()
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
    
    //好评率
    //计算
    //判断他是不是0
    CGFloat percentage = (foodModel.praise_num) ? (foodModel.praise_num / (foodModel.praise_num + foodModel.tread_num)) : 0 ;
    
    
    _percentageLabel.text = [NSString stringWithFormat:@"%.f%%", percentage * 100];

    //进度
    _progressView.progress = percentage;
}
@end
