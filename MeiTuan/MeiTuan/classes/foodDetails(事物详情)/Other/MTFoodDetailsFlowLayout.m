//
//  MTFoodDetailsFlowLayout.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/3.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTFoodDetailsFlowLayout.h"

@implementation MTFoodDetailsFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    //他的尺寸等于collectionView的尺寸
    self.itemSize = self.collectionView.bounds.size;
    
    //滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //最小行距和组距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
}
@end
