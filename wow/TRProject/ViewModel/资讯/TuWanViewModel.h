//
//  TuWanViewModel.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanModel.h"
#import "TuWanNetWorking.h"
typedef NS_ENUM(NSUInteger,DetailType) {
DetailTypeHTML,
    DetailTypePic,
    DetailTypeVideo,

};
@interface TuWanViewModel : BaseViewModel
//第一页向第二页传参，（aid）(图片)
- (NSString *)aidForRow:(NSInteger)row;
- (NSString *)adAidForRow:(NSInteger)row;
//数据类型
- (DetailType)adTypeForRow:(NSInteger)row;
- (DetailType)typeForRow:(NSInteger)row;
//视频的链接地址
- (NSURL *)videoURLForRow:(NSInteger)row;
- (NSURL *)adVideoURLForRow:(NSInteger)row;
//html的链接地址
- (NSURL *)htmlURLForRow:(NSInteger)row;
- (NSURL *)adHtmlURLForRow:(NSInteger)row;

//需求
@property(nonatomic,readonly) BOOL hasAD;
@property(nonatomic,readonly) NSInteger adNumber;
- (NSURL *)adIconURL:(NSInteger)row;
- (NSString *)adTitle:(NSInteger)row;

//UI
//带三个图
-(NSArray<NSURL *> *)picList:(NSInteger)row;
-(BOOL)hasPic:(NSInteger)row;
-(NSString *)title:(NSInteger)row;
-(NSString *)click:(NSInteger)row;
//只有一个图
-(NSURL *)pic:(NSInteger)row;
-(NSString *)detail:(NSInteger)row;


//Model
@property(nonatomic)NSArray<TuWanListModel *> *adList;//存放头部广告的数组
@property(nonatomic,readonly)NSInteger rowNumber;
@property(nonatomic)NSMutableArray<TuWanListModel *> *dataList;//存放列表数据的数组
@property(nonatomic,readonly)NSInteger start;
- (instancetype)initWithMsgType:(TuWanMsgType)msgType;
@property(nonatomic,readonly)TuWanMsgType msgType;
@end
