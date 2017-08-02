//
//  MTHeadView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTHeadView.h"
#import "MTPOI_infoModel.h"
#import "MTLoopView.h"
#import "MTInfoModel.h"

@interface MTHeadView ()

//背景图
@property (nonatomic, weak) UIImageView *backImageView;

//头像
@property (nonatomic, weak) UIImageView *headxView;

//店名
@property (nonatomic, weak) UILabel *nameLabel;

//公告
@property (nonatomic, weak) UILabel *noticeLabel;

//轮播视图
@property (nonatomic, weak) MTLoopView *loopView;


@end
@implementation MTHeadView

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

- (void)setupUI
{
    //1.添加背景图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    
    //填充模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //添加约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    _backImageView = imageView;
    
    //2.添加轮播视图
    MTLoopView *loopView = [[MTLoopView alloc] init];
    [self addSubview:loopView];
        
    [loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.bottom.offset(-8);
        make.height.offset(20);
    }];
    
    _loopView = loopView;
    
    //3.虚线
    UIView *dashLineView = [[UIView alloc] init];
    dashLineView.backgroundColor = [UIColor colorWithPatternImage:[UIImage dashLineViewWithColor:[UIColor whiteColor]]];
    [self addSubview:dashLineView];
    
    //约束
    [dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(loopView).offset(0);
        make.right.offset(0);
        make.bottom.equalTo(loopView.mas_top).offset(-8);
        make.height.offset(1);
    }];
    
    //4.头像
    UIImageView *headxView = [[UIImageView alloc] init];
    [self addSubview:headxView];
    
    //设置细节
    headxView.layer.cornerRadius = 32;
    headxView.clipsToBounds = YES;
    headxView.contentMode = UIViewContentModeScaleAspectFill;
    
    // 设置边框颜色
    headxView.layer.borderColor = [UIColor colorWithWhite:1 alpha:0.7].CGColor;
    
    // 边框宽度
    headxView.layer.borderWidth = 2;
    
    [headxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dashLineView).offset(0);
        make.bottom.equalTo(dashLineView.mas_top).offset(-8);
        make.width.height.offset(64);
    }];
    
    
    //5.店名
    UILabel *nameLabel = [UILabel makeLabelWithText:@"粮心发现" andTextFont:16 andTextColor:[UIColor whiteColor]];
    [self addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headxView.mas_right).offset(16);
        make.centerY.equalTo(headxView).offset(-16);
    }];
    
    //6.商家公告
    UILabel *noticeLabel = [UILabel makeLabelWithText:@"谷歌谷歌过过过过过过过过过过过过过过过过过过过" andTextFont:14 andTextColor:[UIColor colorWithWhite:1 alpha:0.9]];
    
    [self addSubview:noticeLabel];
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nameLabel).offset(0);
        make.centerY.equalTo(headxView).offset(16);
        make.right.offset(-16);
    }];
    _headxView = headxView;
    _nameLabel = nameLabel;
    _noticeLabel = noticeLabel;
    
}

#pragma mark - 有了数据之后给子控件设置数据
- (void)setPOI_infoModel:(MTPOI_infoModel *)POI_infoModel
{
    _POI_infoModel = POI_infoModel;
    
    // 删除url后面多余的.webp后缀
    NSString *bgImageURLStr = [POI_infoModel.poi_back_pic_url stringByDeletingPathExtension];
    
    // 设置背景图片
    [_backImageView sd_setImageWithURL:[NSURL URLWithString:bgImageURLStr]];
    
    // 头像
    [_headxView sd_setImageWithURL:[NSURL URLWithString:[POI_infoModel.pic_url stringByDeletingPathExtension]]];
    
    // 店名
    _nameLabel.text = POI_infoModel.name;
    
    //商家公告
    _noticeLabel.text = POI_infoModel.bulletin;
    
//    self.loopView.backgroundColor = [UIColor whiteColor];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:POI_infoModel.discounts2.count];
    for (NSDictionary *dict in POI_infoModel.discounts2) {
        MTInfoModel *loopViewModel = [MTInfoModel infoWithDict:dict];
        [arrM addObject:loopViewModel];
    }
    _loopView.loopViewModel = arrM;
    
}

@end
