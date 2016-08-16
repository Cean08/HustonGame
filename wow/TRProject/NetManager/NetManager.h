//
//  NetManager.h
//  TRProject
//
//  Created by tarena on 16/7/14.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetworking.h"
#import "ToolModel.h"
#import "WowsgModel.h"
#import "FlashBackModel.h"
#import "TuWanItem3Model.h"
#import "AllReplyModel.h"
#import "ToyModel.h"
#import "ToyDetailModel.h"
#import "FBHeroModel.h"
#import "HearoModel.h"

//倒影大厅里，穷举几个地址一样的
typedef NS_ENUM(NSUInteger, FlashBackType) {
    FlashBackTypeTianti_MMR,//联赛-MMR
    FlashBackTypeMMR,//快速比赛-MMR
    FlashBackTypeTianti_fight,//联赛-战斗力
    FlashBackTypeFight,//快速比赛-战斗力
};

//倒影大厅里，英雄数据
typedef NS_ENUM(NSUInteger, FBHeroType) {
    FBHeroTypeTianti_hero, //英雄-联赛 = 3
    FBHeroTypeHero, //英雄-快速比赛 = 2
};


@interface NetManager : BaseNetworking

/***************  工具  ********************/
//获取工具首页数据
+ (id)getToolCompletionHandler:(void(^)(NSArray<ToolModel *> *model, NSError *error))completionHandler;

//获取时光监控局数据(首页第1个cell)
+ (id)getWowsgCompletionHandler:(void(^)(WowsgModel *model, NSError *error))completionHandler;

//获取倒影大厅数据(首页第2个cell)
    //获取MMR-fight数据
+ (id)getFlashBack:(FlashBackType)flashBackType completionHandler:(void(^)(NSArray<FlashBackModel *> *model, NSError *error))completionHandler;
    //获取英雄数据
+ (id)getFlashBackHero:(FBHeroType)type page:(NSInteger)page completionHandler:(void(^)(NSArray<FBHeroModel *> *model, NSError *error))completionHandler;
//获取玩具箱数据(首页最后一个cell)
//玩具箱
+(id)getToyCompletionHandler:(void(^)(NSArray<ToyModel *> *model,NSError *error))completionHandler;
//玩具详情页
+(id)getDetailID:(NSInteger)ID completionHandler:(void(^)(ToyDetailModel *model,NSError *error))completionHandler;


/***************  圈子  ********************/
+ (id)getTuWanBbsPage:(NSInteger)page completionHandler:(void(^)(TuWanItem3Model *model, NSError *error))completionHandler;

+ (id)getAllReplyPage:(NSInteger)page userID:(NSString *)tid completionHandler:(void(^)(AllReplyModel *model, NSError *error))completionHandler;

/***************  风暴英雄数据库  ********************/
+ (id)getHearoDataCompletionHandler:(void(^)(NSArray<HearoModel *> *model, NSError *error))completionHandler;
@end
