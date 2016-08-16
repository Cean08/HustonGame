//
//  ToyViewModel.h
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToyModel.h"
#import "NetManager.h"
@interface ToyViewModel : NSObject
//根据UI
@property(nonatomic,readonly)NSInteger rowNumber;
-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSString *)titleLabelForRow:(NSInteger)row;

//根据model
@property(nonatomic)NSArray<ToyModel *> *dataList;

//详情
-(NSInteger)detail:(NSInteger)row;
@end
