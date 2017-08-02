//
//  MTLoopView.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTLoopView.h"
#import "MTinfoView.h"

@interface MTLoopView ()

//infoView
@property (nonatomic, strong) MTinfoView *infoView;

//索引
@property (nonatomic, assign) NSInteger index;

@end

@implementation MTLoopView
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
    
    MTinfoView *infoView = [[MTinfoView alloc] init];
    [self addSubview:infoView];
    
    [infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.offset(0);
        make.right.offset(-16);
    }];
    
    _infoView = infoView;
    _index = 0;
    //添加无线循环
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(setData) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    

}
#pragma mark - 传数据
-(void)setData
{
    
        //计算下标
        _index = (_index + 7) % 7;
        
        //给infoview传数据
        _infoView.infoModel =  _loopViewModel[_index];
        
        _index++;
    
}

-(void)setLoopViewModel:(NSArray<MTInfoModel *> *)loopViewModel
{
    _loopViewModel = loopViewModel;
    
    [self setData];
}

@end
