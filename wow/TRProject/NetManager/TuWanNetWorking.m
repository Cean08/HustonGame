//
//  TuWanNetWorking.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanNetWorking.h"

@implementation TuWanNetWorking
+(id)getVideoPic:(NSString *)aid completionHandler:(void (^)(VideoAndPicModel *, NSError *))completionHandler{
    NSString *path = [NSString stringWithFormat:kVideoAndPicPath,aid];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        //注意，这里服务器给我们是一个数组，我们需要字典.
        NSArray *tmpArr = [VideoAndPicModel parse:responseObj];
        ! completionHandler ?: completionHandler((tmpArr.firstObject),error);
    }];

}


+(id)getTuWanData:(TuWanMsgType)tuwanMsgType start:(NSInteger)start completionHandler:(void (^)(TuWanModel *, NSError *))completionHandler{
    NSString *tmpPath = nil;
    switch (tuwanMsgType) {
        case TuwanMsgTypeTouTiao: {
            tmpPath = kTouTiaoPath;
            break;
        }
        case TuwanMsgTypeDuJia: {
            tmpPath = kDuJiaPath;
            break;
        }
        case TuwanMsgTypeAnHei: {
            tmpPath = kAnHeiPath;
            break;
        }
        case TuwanMsgTypeMoShou: {
            tmpPath = kMoShouPath;
            break;
        }
        case TuwanMsgTypeFengBao: {
            tmpPath = kFengBaoPath;
            break;
        }
        case TuwanMsgTypeLuShi: {
            tmpPath = kLuShiPath;
            break;
        }
        case TuwanMsgTypeXingJi: {
            tmpPath = kXingJiPath;
            break;
        }
        case TuwanMsgTypeShouWang: {
            tmpPath = kShouWangPath;
            break;
        }
        case TuwanMsgTypeTuPian: {
            tmpPath = kTuPianPath;
            break;
        }
        case TuwanMsgTypeShiPin: {
            tmpPath = kShiPinPath;
            break;
        }
        case TuwanMsgTypeGongLue: {
            tmpPath = kGongLuePath;
            break;
        }
        case TuwanMsgTypeHuanHua: {
            tmpPath = kHuanHuaPath;
            break;
        }
        case TuwanMsgTypeQuWen: {
            tmpPath = kQuWenPath;
            break;
        }
        case TuwanMsgTypeCOS: {
            tmpPath = kCOSPath;
            break;
        }
        case TuwanMsgTypeMeiNv: {
            tmpPath = kMeiNvPath;
            break;
        }
        case TuWanMsgTypeIntro: {
            tmpPath = kIntroPath;
            break;
        }
            
}  //
    NSString *path = [NSString stringWithFormat:tmpPath,start];
    NSLog(@"%@", path);
    //stringByAddingPercentEscapesUsingEncoding
     path  = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",path);
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        ! completionHandler ?: completionHandler([TuWanModel parse:responseObj],error);
    }];
    
    
}
    
    
@end
