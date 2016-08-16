//
//  FBHeroViewModel.h
//  TRProject
//
//  Created by Cean on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface FBHeroViewModel : BaseViewModel
//tableView的行数
@property (nonatomic, readonly) NSInteger rowNumber;
//图片URL，解析属性是heroico
- (NSURL *)iconURL:(NSInteger)row;
//昵称: heroname
- (NSString *)heroName:(NSInteger)row;
//使用次数: ones
- (NSString *)useCount:(NSInteger)row;
//胜率:pro , CGFloat类型
- (NSString *)tianti_pro:(NSInteger)row;
//第一高手: playername
- (NSString *)numberOne:(NSInteger)row;


//接收FlashBackHeroVC传过来切换控制器的索引值
@property (nonatomic, readonly)NSInteger fbType;
- (instancetype)initWithFbType:(NSInteger)fbType;
//请求更多页码
@property (nonatomic) NSInteger page;
//存储英雄模型数据
@property (nonatomic) NSMutableArray<FBHeroModel *> *heroList;

@end
