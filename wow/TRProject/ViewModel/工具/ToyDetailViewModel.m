//
//  DetailViewModel.m
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ToyDetailViewModel.h"

@implementation ToyDetailViewModel
//Model
- (NSMutableArray<ToyDetailModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<ToyDetailModel *> alloc] init];
    }
    return _dataList;
}
//UI
-(NSInteger)rowNumber{
    return self.dataList.count;
}
-(NSURL *)icon:(NSInteger)row{
    NSString *path = [NSString stringWithFormat:@"http://db.wow.tuwan.com%@",self.dataList[row].Icon];
    return path.zjt_URL;
}
-(NSString *)title:(NSInteger)row{
    return self.dataList[row].Title;
}
-(NSString *)quality:(NSInteger)row{
    return self.dataList[row].Quality;
}
-(NSString *)reqLevel:(NSInteger)row{
    NSString *req = [NSString stringWithFormat:@"需求等级:%ld",self.dataList[row].ReqLevel];
    return req;
}
-(NSString *)level:(NSInteger)row{
    NSString *level = [NSString stringWithFormat:@"物品等级:%ld",self.dataList[row].Level];
    return level;
}
-(NSString *)spell:(NSInteger)row{
    return self.dataList[row].Spell;
}
-(NSString *)description:(NSInteger)row{
    return self.dataList[row].Description;
}
-(NSString *)get:(NSInteger)row{
    return self.dataList[row].Get;
}
-(BOOL)hasGetLB:(NSInteger)row {
    return [self.dataList[row].Get isEqualToString:@""] ? NO : YES;
}
@end
