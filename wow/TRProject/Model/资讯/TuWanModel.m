//
//  TuWanModel.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanModel.h"

@implementation TuWanModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{

    return @{@"indexpic":@"data.indexpic",@"list":@"data.list"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"indexpic":[TuWanListModel class],@"list":[TuWanListModel class]};
}

@end

@implementation TuWanListModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{


    return @{@"desc":@"description",@"typeName":@"typename"};
}
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{

    return @{@"showitem":[TuWanShowitemModel class]};
}


@end

@implementation TuWanInfochildModel

@end

@implementation TuWanShowitemModel
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"height":@"info.height",@"width":@"info.width"};

}

@end




