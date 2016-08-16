//
//  DetailViewModel.h
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToyDetailModel.h"
//玩具详情ViewModel层
@interface ToyDetailViewModel : NSObject
//根据UI
@property(nonatomic,readonly)NSInteger rowNumber;
-(NSURL *)icon:(NSInteger)row;
-(NSString *)title:(NSInteger)row;
-(NSString *)quality:(NSInteger)row;
-(NSString *)reqLevel:(NSInteger)row;
-(NSString *)level:(NSInteger)row;
-(NSString *)spell:(NSInteger)row;
-(NSString *)description:(NSInteger)row;
-(NSString *)get:(NSInteger)row;
-(BOOL)hasGetLB:(NSInteger)row;
//根据Model
@property(nonatomic)NSMutableArray<ToyDetailModel *> *dataList;

@end
