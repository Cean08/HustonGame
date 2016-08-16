//
//  ToyModel.m
//  玩具箱
//
//  Created by tarena11 on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ToyModel.h"

@implementation ToyModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"esArray":[ToyModel class]};
}
@end



