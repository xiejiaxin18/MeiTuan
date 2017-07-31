//
//  NSObject+LinearFormula.m
//  HMWaiMai
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "NSObject+LinearFormula.h"

@implementation NSObject (LinearFormula)


- (CGFloat)resultWithValue1:(HMValue)value1 andValue2:(HMValue)value2 {
    CGFloat a = (value1.result - value2.result) / (value1.consult - value2.consult);
    CGFloat b = value1.result - (a * value1.consult);
    
    
    return a * [(NSNumber *)self floatValue]  + b;
}

@end
