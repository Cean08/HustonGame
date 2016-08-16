//
//  ToyViewModel.m
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ToyViewModel.h"

@implementation ToyViewModel
//UI
-(NSInteger)rowNumber{
    return self.dataList.count;
}
-(NSURL *)iconURLForRow:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://db.wow.tuwan.com%@",self.dataList[row].Icon.zjt_URL];
    return path.zjt_URL;
}
-(NSString *)titleLabelForRow:(NSInteger)row{
    return self.dataList[row].Name;
}
//根据model
-(NSArray<ToyModel *> *)dataList{
    if (_dataList == nil) {
        _dataList = [NSArray array];
    }
    return _dataList;
}
//详情
-(NSInteger)detail:(NSInteger)row{
    return self.dataList[row].ID;
}
@end
