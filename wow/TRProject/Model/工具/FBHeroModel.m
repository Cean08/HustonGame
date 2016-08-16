//
//  FBHeroModel.m
//  TRProject
//
//  Created by Cean on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "FBHeroModel.h"

@implementation FBHeroModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"esArray": [FBHeroModel class]};
}
@end



