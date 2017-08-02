//
//  MTShopOrderFoodCell.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderFoodCell.h"

@interface MTShopOrderFoodCell ()

@property (weak, nonatomic) IBOutlet UIImageView *pictureView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *month_saled_contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *praise_contentLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *min_priceLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *descLabelTopConstraint;


@end
@implementation MTShopOrderFoodCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
