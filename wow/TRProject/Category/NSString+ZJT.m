//
//  NSString+ZJT.m
//  01_网易视频
//
//  Created by tarena11 on 16/7/22.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+ZJT.h"

@implementation NSString (ZJT)
-(NSURL *)zjt_URL{
    return [NSURL URLWithString:self];
}
@end
