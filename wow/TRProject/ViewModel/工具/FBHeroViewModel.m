//
//  FBHeroViewModel.m
//  TRProject
//
//  Created by Cean on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "FBHeroViewModel.h"

@implementation FBHeroViewModel
//tableView的行数
- (NSInteger)rowNumber {
    return self.heroList.count;
}
//图片URL，解析属性是heroico
- (NSURL *)iconURL:(NSInteger)row {
    return self.heroList[row].heroico.xq_URL;
}
//昵称: heroname
- (NSString *)heroName:(NSInteger)row {
    return self.heroList[row].heroname;
}
//使用次数: ones
- (NSString *)useCount:(NSInteger)row {
    return self.heroList[row].ones;
}
//胜率:pro , CGFloat类型
- (NSString *)tianti_pro:(NSInteger)row {
    return [NSString stringWithFormat:@"%02lf%%", self.heroList[row].pro];
}
//第一高手: playername
- (NSString *)numberOne:(NSInteger)row {
    return self.heroList[row].playername;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    NSInteger tmpPage = 0;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 10;
    }
    self.dataTask = [NetManager getFlashBackHero:self.fbType page:tmpPage completionHandler:^(NSArray<FBHeroModel *> *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.heroList removeAllObjects];
            }
            [self.heroList addObjectsFromArray:model];
            _page = tmpPage;
        }
        !completionHandler ?: completionHandler(error);
    }];
}


#pragma init初始化

- (NSMutableArray<FBHeroModel *> *)heroList {
    if(_heroList == nil) {
        _heroList = [[NSMutableArray alloc] init];
    }
    return _heroList;
}

- (instancetype)initWithFbType:(NSInteger)fbType {
    if (self = [super init]) {
        _fbType = fbType;
    }
    return self;
}

- (instancetype)init {
    NSAssert1(NO, @"%s: 必须使用initWithFbType:方法初始化", __FUNCTION__);
    return nil;
}
@end
