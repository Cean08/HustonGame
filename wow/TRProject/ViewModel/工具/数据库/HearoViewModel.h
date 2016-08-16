//
//  HearoViewModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/4.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HearoModel.h"
@interface HearoViewModel : NSObject
@property(nonatomic,readonly) NSInteger rowNUmber;
- (NSURL *)imgURL:(NSInteger)row;
- (NSString *)gameLB:(NSInteger)row;
- (NSString *)nameLB:(NSInteger)row;

@property(nonatomic) NSArray<HearoModel *> *dataList;
@end
