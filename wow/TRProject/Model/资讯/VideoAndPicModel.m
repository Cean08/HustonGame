//
//  VideoAndPicModel.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoAndPicModel.h"

@implementation VideoAndPicModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"showitem": [VideoAndPicShowitemModel class],
             @"relevant": [VideoAndPicRelevantModel class],
             @"content": [VideoAndPicShowitemModel class]};
}
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"typeName": @"typename",
             @"desc": @"description"};

}


@end


@implementation VideoAndPicShowitemModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"width": @"info.width",
             @"height": @"info.height"};

}
@end



@implementation VideoAndPicRelevantModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"typeName": @"typename",
             @"desc": @"description"};
}
@end





