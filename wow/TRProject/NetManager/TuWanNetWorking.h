//
//  TuWanNetWorking.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetWorking.h"
#import "TuWanModel.h"
#import "VideoAndPicModel.h"

typedef NS_ENUM(NSUInteger,TuWanMsgType) {
    TuwanMsgTypeTouTiao,
    TuwanMsgTypeDuJia,
    TuwanMsgTypeAnHei,
    TuwanMsgTypeMoShou,
    TuwanMsgTypeFengBao,
    TuwanMsgTypeLuShi,
    TuwanMsgTypeXingJi,
    TuwanMsgTypeShouWang,
    TuwanMsgTypeTuPian,
    TuwanMsgTypeShiPin,
    TuwanMsgTypeGongLue,
    TuwanMsgTypeHuanHua,
    TuwanMsgTypeQuWen,
    TuwanMsgTypeCOS,
    TuwanMsgTypeMeiNv,
    TuWanMsgTypeIntro,
};

@interface TuWanNetWorking : BaseNetworking
+(id)getTuWanData:(TuWanMsgType)tuwanMsgType start:(NSInteger)start completionHandler:(void(^)(TuWanModel *model,NSError *error))completionHandler;


+(id)getVideoPic:(NSString *)aid completionHandler:(void(^)(VideoAndPicModel *model,NSError *error))completionHandler;

@end
