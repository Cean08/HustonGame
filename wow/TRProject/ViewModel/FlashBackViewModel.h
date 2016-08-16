//
//  FlashBackViewModel.h
//  TRProject
//
//  Created by Cean on 16/7/27.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"

@interface FlashBackViewModel : BaseViewModel

//tableView的行数
@property (nonatomic, readonly) NSInteger rowNumber;
//图片URL，解析属性是avatar
- (NSURL *)iconURL:(NSInteger)row;
//昵称: playername
- (NSString *)nikeName:(NSInteger)row;
//MMR值: tianti_mmr
- (NSString *)tianti_mmr:(NSInteger)row;
//战斗力: tianti_fight
- (NSString *)tianti_fight:(NSInteger)row;
//胜率:tianti_pro , CGFloat类型
- (NSString *)tianti_pro:(NSInteger)row;
//录像数: tianti_total
- (NSString *)tianti_total:(NSInteger)row;
//头衔: ranktier
- (NSString *)ranktier:(NSInteger)row;

//接收FlashBackVC传过来切换控制器的索引值
@property (nonatomic, readonly)FlashBackType fbType;
- (instancetype)initWithFbType:(FlashBackType)fbType;

//存储英雄模型数据
@property (nonatomic) NSArray<FlashBackModel *> *heroList;



@end
