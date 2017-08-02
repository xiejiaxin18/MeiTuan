//
//  MTInfoModel.m
//  MeiTuan
//
//  Created by 谢佳芯 on 2017/8/2.
//  Copyright © 2017年 xjx. All rights reserved.
//

#import "MTInfoModel.h"

@implementation MTInfoModel

+ (instancetype)infoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
