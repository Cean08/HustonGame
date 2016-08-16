//
//  AllReplyModel.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AllReplyModel.h"

@implementation AllReplyModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"result" : [AllReplyModel class]};
}

@end


@implementation AllReplyResultModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"postlist" : [Postlist class],
             @"forum_threadlist" : [AllReplyResultModel class],
             };
}

@end


@implementation Postlist

@end


@implementation AllReplyResultForumThreadlistModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"ratelog" : [Ratelog class]};
}

@end


@implementation Ratelog

@end


