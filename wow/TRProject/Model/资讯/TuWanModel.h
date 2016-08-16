//
//  TuWanModel.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TuWanListModel ;
@class TuWanInfochildModel,TuWanShowitemModel;
@interface TuWanModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *code;



@property (nonatomic, strong) NSArray<TuWanListModel  *> *indexpic;

@property (nonatomic, strong) NSArray<TuWanListModel  *> *list;

@end

//从网络获取数据要拿数据最全的URL，且用数据中最多的那一组去解析
@interface TuWanListModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, copy) NSString *showtype;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *click;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *typechild;

@property (nonatomic, copy) NSString *longtitle;
//typename->typeName
@property (nonatomic, copy) NSString *typeName;

@property (nonatomic, copy) NSString *html5;

@property (nonatomic, strong) TuWanInfochildModel *infochild;

@property (nonatomic, strong) NSArray<TuWanShowitemModel *> *showitem;

@property (nonatomic, copy) NSString *litpic;

@property (nonatomic, copy) NSString *aid;

@property (nonatomic, assign) NSInteger pictotal;

@property (nonatomic, copy) NSString *toutiao;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *murl;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, copy) NSString *zangs;

@property (nonatomic, copy) NSString *writer;

@property (nonatomic, copy) NSString *timer;

@property (nonatomic, copy) NSString *comment;
//description->desc
@property (nonatomic, copy) NSString *desc;

@end
@interface TuWanInfochildModel : NSObject

@property (nonatomic, copy) NSString *later;

@property (nonatomic, copy) NSString *feature;

@property (nonatomic, copy) NSString *facial;

@property (nonatomic, copy) NSString *shoot;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, copy) NSString *cn;

@end

@interface TuWanShowitemModel : NSObject

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, assign) NSInteger height;

@end

