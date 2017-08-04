//
//  NSObject+LinearFormula.h
//  HMWaiMai
//
//  Created by apple on 2017/7/30.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

struct MTValue {
    CGFloat consult;
    CGFloat result;
};
typedef struct MTValue MTValue;


CG_INLINE MTValue
MTValueMake(CGFloat consult, CGFloat result)
{
    MTValue value; value.consult = consult; value.result = result; return value;
}

@interface NSObject (LinearFormula)


- (CGFloat)resultWithValue1:(MTValue)value1 andValue2:(MTValue)value2;

@end
