//
//  WowsgViewModel.m
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "WowsgViewModel.h"

@implementation WowsgViewModel
- (NSInteger)rowNumber {
    return self.dataList.count;
}
//大区
- (NSString *)serverName:(NSInteger)row {
    return self.dataList[row].servername;
}
//最新价
- (NSString *)nowPrice:(NSInteger)row {
    return self.dataList[row].nowprice;
}
//涨幅 = nowprice - price
- (NSString *)rose:(NSInteger)row {
    NSInteger price = self.dataList[row].price;
    NSInteger nowPrice = self.dataList[row].nowprice.integerValue;
    NSInteger rose = nowPrice - price;
    if (rose > 0) {
        return [NSString stringWithFormat:@"+%ld", rose];
    }
    return [NSString stringWithFormat:@"%ld", rose];
}
- (NSURL *)detailURL:(NSInteger)row {
    return self.dataList[row].url.xq_URL;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getWowsgCompletionHandler:^(WowsgModel *model, NSError *error) {
        if (!error) {
            self.dataList = model.data;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
@end
