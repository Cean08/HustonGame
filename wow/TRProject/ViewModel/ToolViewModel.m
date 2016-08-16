//
//  ToolViewModel.m
//  TRProject
//
//  Created by Cean on 16/7/20.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ToolViewModel.h"

@implementation ToolViewModel
- (NSInteger)rowNumber {
    return self.toolData.count;
}
- (NSURL *)iconURL:(NSInteger)row {
    return self.toolData[row].img.xq_URL;
}
- (NSString *)time:(NSInteger)row {
    long long seconds = self.toolData[row].pubdate;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy年MM月dd日";
    NSString *str = [formatter stringFromDate:date];
    return [NSString stringWithFormat:@"更新时间:%@", str];
}
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    self.dataTask = [NetManager getToolCompletionHandler:^(NSArray<ToolModel *> *model, NSError *error) {
        if (!error) {
            self.toolData = model;
        }
        !completionHandler ?: completionHandler(error);
    }];
}
@end
