//
//  WowsgModel.h
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WowsgDataModel;
@interface WowsgModel : NSObject

@property (nonatomic, assign) NSInteger err;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<WowsgDataModel *> *data;

@end
@interface WowsgDataModel : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *area;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *servername;

@property (nonatomic, copy) NSString *nowprice;

@end

