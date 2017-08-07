//
//  MTShopOrderCountView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTShopOrderCountView.h"
#import "MTShopOrderFoodModel.h"

@interface MTShopOrderCountView ()

//减号按钮
@property (weak, nonatomic) IBOutlet UIButton *minusBtn;

//显示数字
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end
@implementation MTShopOrderCountView

#pragma mark - 加载xib
+ (instancetype)shopOrderCountView
{
    return [[[UINib nibWithNibName:@"MTShopOrderCountView" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
}
#pragma mark 减号
- (IBAction)minusBtnClick {
    
    // 直接操作模型中的属性值
    _foodModel.count--;
    
    [self updateState];
    
    _type = MTShopOrderCountViewBtnTypeMinus;
    
    if ([self.delegate respondsToSelector:@selector(shopOrderCountViewValueChange:)]) {
        [self.delegate shopOrderCountViewValueChange:self];
    }
}

#pragma mark - 加号
- (IBAction)addBtnClick {
    _foodModel.count++;
    
    [self updateState];
    _type = MTShopOrderCountViewBtnTypeAdd;
    
    if ([self.delegate respondsToSelector:@selector(shopOrderCountViewValueChange:)]) {
        [self.delegate shopOrderCountViewValueChange:self];
    }
}


#pragma mark - 更新状态
- (void)updateState
{
    // 判断数量是否隐藏
    _minusBtn.hidden = !_foodModel.count;
    
    _countLabel.hidden = !_foodModel.count;
    
    // 显示数量
    _countLabel.text = @(_foodModel.count).description;
}

-(void)setFoodModel:(MTShopOrderFoodModel *)foodModel
{
    _foodModel = foodModel;
    
    [self updateState];
}
@end
