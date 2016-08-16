//
//  FlashBackViewModel.m
//  TRProject
//
//  Created by Cean on 16/7/27.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "FlashBackViewModel.h"

@implementation FlashBackViewModel

//tableView的行数
-(NSInteger)rowNumber {
    return self.heroList.count;
}
//图片URL，解析属性是avatar
- (NSURL *)iconURL:(NSInteger)row {
    return self.heroList[row].avatar.xq_URL;
}
//昵称: playername
- (NSString *)nikeName:(NSInteger)row {
    return self.heroList[row].playername;
}
//MMR值: tianti_mmr
- (NSString *)tianti_mmr:(NSInteger)row {
    return self.heroList[row].tianti_mmr;
}
//战斗力: tianti_fight
- (NSString *)tianti_fight:(NSInteger)row {
    return self.heroList[row].tianti_fight;
}
//胜率:tianti_pro , CGFloat类型
- (NSString *)tianti_pro:(NSInteger)row {
    return [NSString stringWithFormat:@"%.0lf%%", self.heroList[row].tianti_pro];
}
//录像数: tianti_total
- (NSString *)tianti_total:(NSInteger)row {
    return self.heroList[row].tianti_total;
}
//头衔: ranktier
- (NSString *)ranktier:(NSInteger)row {
    return self.heroList[row].ranktier;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getFlashBack:self.fbType completionHandler:^(NSArray<FlashBackModel *> *model, NSError *error) {
        if (!error) {
            self.heroList = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma init初始化
- (instancetype)initWithFbType:(FlashBackType)fbType {
    if (self = [super init]) {
        _fbType = fbType;
    }
    return self;
}
- (instancetype)init {
    NSAssert1(NO, @"%s: 必须使用initWithFbType:方法初始化", __FUNCTION__);
    return nil;
}






@end
