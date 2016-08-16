//
//  NSString+CT.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+CT.h"

@implementation NSString (CT)
-(NSURL *)ct_URL{
    return [NSURL URLWithString:self];
}
@end
