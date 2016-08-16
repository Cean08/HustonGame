//
//  PhotoViewModel.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PhotoViewModel.h"

@implementation PhotoViewModel

-(instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}

- (instancetype)init{
    NSCAssert1(NO, @"%s:必须使用initWithAid:方法初始化，", __FUNCTION__);
    return nil;

}
-(NSURL *)iconURL:(NSInteger)row{
    return _model.content[row].pic.ct_URL;
    
}
- (NSInteger)rowNumber{
    return _model.content.count;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    self.dataTask = [TuWanNetWorking getVideoPic:_aid completionHandler:^(VideoAndPicModel *model, NSError *error) {
        _model = model;
        ! completionHandler ?: completionHandler(error);
    }];
}

@end
