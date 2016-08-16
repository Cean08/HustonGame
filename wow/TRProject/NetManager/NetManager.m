//
//  NetManager.m
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NetManager.h"


@implementation NetManager
/***************  工具  ********************/
+ (id)getToolCompletionHandler:(void (^)(NSArray<ToolModel *> *, NSError *))completionHandler {
    return [self GET:kToolPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([ToolModel parse:responseObj], error);
    }];
}

+ (id)getWowsgCompletionHandler:(void (^)(WowsgModel *, NSError *))completionHandler {
    return [self GET:kWowSgPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([WowsgModel parse:responseObj], error);
    }];
}

+ (id)getFlashBack:(FlashBackType)flashBackType completionHandler:(void (^)(NSArray<FlashBackModel *> *, NSError *))completionHandler {
    NSString *tmpStr = nil;
    switch (flashBackType) {
        case FlashBackTypeTianti_MMR: {
            tmpStr = @"tianti_mmr";
            break;
        }
        case FlashBackTypeTianti_fight: {
            tmpStr = @"tianti_fight";
            break;
        }
        case FlashBackTypeMMR: {
            tmpStr = @"mmr";
            break;
        }
        case FlashBackTypeFight: {
            tmpStr = @"fight";
            break;
        }
    }
    NSString *path = [NSString stringWithFormat:kFlBLXPath, tmpStr];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([FlashBackModel parse:responseObj], error);
    }];
}

+ (id)getFlashBackHero:(FBHeroType)type page:(NSInteger)page completionHandler:(void (^)(NSArray<FBHeroModel *> *, NSError *))completionHandler {
    //根据网址得来
    switch (type) {
        case FBHeroTypeTianti_hero: {
            type = 3;
            break;
        }
        case FBHeroTypeHero: {
            type = 2;
            break;
        }
    }
    //网络请求更多时后面的网址拼接
    NSString *pageStr = page ? [NSString stringWithFormat:@"&start=%ld", page] : @"";
    NSString *path = [NSString stringWithFormat:kFlashHeroPath, type, pageStr];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([FBHeroModel parse:responseObj], error);
    }];
}


+(id)getToyCompletionHandler:(void (^)(NSArray<ToyModel *> *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kToyPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([ToyModel parse:responseObj],error);
    }];
}

+(id)getDetailID:(NSInteger)ID completionHandler:(void (^)(ToyDetailModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kDetailPath,(long)ID];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([ToyDetailModel parse:responseObj],error);
    }];
}
/***************  圈子  ********************/
+ (id)getTuWanBbsPage:(NSInteger)page completionHandler:(void (^)(TuWanItem3Model *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:kItem3Path, (long)page];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        !completionHandler ?: completionHandler([TuWanItem3Model parse:responseObj], error);
    }];
}

+ (id)getAllReplyPage:(NSInteger)page userID:(NSString *)tid completionHandler:(void (^)(AllReplyModel *, NSError *))completionHandler {
    
    NSString *path = [NSString stringWithFormat:kAllReply, (long)page, tid];
    
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        !completionHandler ?: completionHandler([AllReplyModel parse:responseObj], error);
    }];
}


+ (id)getHearoDataCompletionHandler:(void (^)(NSArray<HearoModel *> *, NSError *))completionHandler {
    NSString *path = [NSString stringWithFormat:kHeroPath];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?:completionHandler([HearoModel parse:responseObj], error);
    }];
}
@end








