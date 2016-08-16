//
//  NSString+Crow.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/14.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NSString+Crow.h"

@implementation NSString (Crow)

- (NSURL *)crow_URL {
    
    return [NSURL URLWithString:self];
}

@end
