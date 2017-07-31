//
//  MTPOI_infoModel.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/7/31.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTPOI_infoModel.h"

@implementation MTPOI_infoModel

+ (instancetype)POI_infoWithDict:(NSDictionary *)dict
{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

/// 重写此方法可以解决 模型属性比字典中key少的问题
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
