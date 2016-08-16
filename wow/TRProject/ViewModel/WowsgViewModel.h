//
//  WowsgViewModel.h
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

//时光监控局中内容
@interface WowsgViewModel : BaseViewModel
//行数
@property (nonatomic, readonly) NSInteger rowNumber;
//服务区类型
- (NSString *)serverName:(NSInteger)row;
//最新价
- (NSString *)nowPrice:(NSInteger)row;
//价格涨幅
- (NSString *)rose:(NSInteger)row;

//跳转详情页的url
- (NSURL *)detailURL:(NSInteger)row;

//存放监控局的数据
@property (nonatomic) NSArray<WowsgDataModel *> *dataList;
@end
