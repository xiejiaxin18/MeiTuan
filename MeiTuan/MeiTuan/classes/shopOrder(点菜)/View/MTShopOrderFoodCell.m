//
//  MTShopOrderFoodCell.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderFoodCell.h"
#import "MTShopOrderFoodModel.h"

@interface MTShopOrderFoodCell ()

//图片
@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

//名字
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

//月销售
@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;

//点赞
@property (weak, nonatomic) IBOutlet UILabel *praise_contentLabel;

//详情
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//价格
@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *liens;



@end
@implementation MTShopOrderFoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setFoodModel:(MTShopOrderFoodModel *)foodModel
{
    _foodModel = foodModel;
    
    //名字
    _nameLabel.text = foodModel.name;
    
    //月销售
    _month_saled_contentLabel.text = foodModel.month_saled_content;
    
    //详情
    _descLabel.text = foodModel.desc;
    
    //详情的约束
    _liens.constant = (foodModel.desc.length == 0) ? 0 : 8;
    
    //价格
    _min_priceLabel.text = [NSString stringWithFormat:@"¥ %@",@(foodModel.min_price)];
    
    //赞
    _praise_contentLabel.text = foodModel.praise_content;
    
    //图片
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:[foodModel.picture stringByDeletingPathExtension]] placeholderImage:[UIImage imageNamed:@"img_food_loading"]];
    
    
}

@end
