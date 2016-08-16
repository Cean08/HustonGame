//
//  FlashBackModel.m
//  TRProject
//
//  Created by Cean on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "FlashBackModel.h"

@implementation FlashBackModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"identity": @"id"};
}
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"esArray": [FlashBackModel class]};
}
@end



