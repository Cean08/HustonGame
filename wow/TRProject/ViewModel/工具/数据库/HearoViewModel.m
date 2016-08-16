//
//  HearoViewModel.m
//  TRProject
//
//  Created by tarena11 on 16/8/4.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HearoViewModel.h"

@implementation HearoViewModel
- (NSArray<HearoModel *> *)dataList {
    if (_dataList == nil) {
        _dataList = [NSArray new];
    }
    return _dataList;
}

- (NSInteger)rowNUmber {
    return self.dataList.count;
}
- (NSURL *)imgURL:(NSInteger)row {
    return self.dataList[row].Img.zjt_URL;
}
- (NSString *)gameLB:(NSInteger)row {
    return self.dataList[row].Game;
}
- (NSString *)nameLB:(NSInteger)row {
    return self.dataList[row].Name;
}
@end
