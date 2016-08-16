//
//  NSString+XQ.m
//  TRProject
//
//  Created by Cean on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSString+XQ.h"

@implementation NSString (XQ)
- (NSURL *)xq_URL{
    return [NSURL URLWithString:self];
}
@end
