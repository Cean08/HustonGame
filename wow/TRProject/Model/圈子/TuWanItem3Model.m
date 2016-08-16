//
//  TuWanItem3Model.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/20.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "TuWanItem3Model.h"

@implementation TuWanItem3Model

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"result" : [Result class]};
}

@end


@implementation Result

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"forum_threadlist" : [Forum_Threadlist class]};
}

@end


@implementation Forum_Threadlist

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"attach" : [Attach class]};
}

@end


@implementation Attach

@end