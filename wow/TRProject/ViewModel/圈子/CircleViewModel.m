//
//  BaseViewModel.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/14.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CircleViewModel.h"

@implementation CircleViewModel

- (NSMutableArray<Forum_Threadlist *> *)tuWanItem3DataList {
    if (_tuWanItem3DataList == nil) {
        _tuWanItem3DataList = [NSMutableArray array];
    }
    return _tuWanItem3DataList;
}

- (NSInteger)page {
    if (!_page) {
        _page = 1;
    }
    return _page;
}

- (NSInteger)threadsNumber {
    if(!_threadsNumber) {
        _threadsNumber = 0;
    }
    return _threadsNumber;
}

- (NSInteger)postsNumber {
    if(!_postsNumber) {
        _postsNumber = 0;
    }
    return _postsNumber;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 1;
    
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    self.dataTask = [NetManager getTuWanBbsPage:tmpPage completionHandler:^(TuWanItem3Model *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                
                [self.tuWanItem3DataList removeAllObjects];
            }
            self.threadsNumber = [model.result.threads integerValue];
            self.postsNumber = [model.result.posts integerValue];
            [self.tuWanItem3DataList addObjectsFromArray:model.result.forum_threadlist];
        }
        !completionHandler ?: completionHandler(error);
    }];
    
    _page = tmpPage;
}

- (NSInteger)rowNumber {
    return self.tuWanItem3DataList.count;
}

- (NSURL *)headerImageForRow:(NSInteger)row {
    return self.tuWanItem3DataList[row].authorface.crow_URL;
}

- (NSString *)userNameForRow:(NSInteger)row {
    return self.tuWanItem3DataList[row].author;
}

- (NSString *)timeForRow:(NSInteger)row {
    return self.tuWanItem3DataList[row].lastpost;
}

- (NSURL *)postImageForRow:(NSInteger)row {
    
    if (self.tuWanItem3DataList[row].attach) {
        return self.tuWanItem3DataList[row].attach.firstObject.url.crow_URL;
    }
    return nil;
}

- (NSString *)messageForRow:(NSInteger)row {
    return self.tuWanItem3DataList[row].message;
}

- (NSString *)replyForRow:(NSInteger)row {
    
    NSString *reply = [NSString stringWithFormat:@"%@个回复，%@个赞", self.tuWanItem3DataList[row].replies, self.tuWanItem3DataList[row].ratetimes];
    
    return reply;
}

- (NSString *)userIDForRow:(NSInteger)row {
    return self.tuWanItem3DataList[row].tid;
}

@end
