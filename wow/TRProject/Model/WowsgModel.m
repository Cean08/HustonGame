//
//  WowsgModel.m
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "WowsgModel.h"

@implementation WowsgModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data": [WowsgDataModel class]};
}
@end
@implementation WowsgDataModel

@end


