//
//  AllReplyViewModel.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AllReplyViewModel.h"

@implementation AllReplyViewModel

- (NSMutableArray<Postlist *> *)allPostList {
    if (_allPostList == nil) {
        _allPostList = [NSMutableArray array];
    }
    return _allPostList;
}

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 1;
    
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    self.dataTask = [NetManager getAllReplyPage:tmpPage userID:_tid completionHandler:^(AllReplyModel *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                
                [self.allPostList removeAllObjects];
            }
            [self.allPostList addObjectsFromArray:model.result.postlist];
        }
        !completionHandler ?: completionHandler(error);
    }];
    _page = tmpPage;
}

- (NSInteger)rowNumber {
    return self.allPostList.count + 1;
}

- (NSURL *)userImageForRow:(NSInteger)row {
    return self.allPostList[row].avatar.crow_URL;
}

- (NSString *)sentUserNameForRow:(NSInteger)row {
    return self.allPostList[row].author;
}

- (NSString *)sentToUserNamenForRow:(NSInteger)row {
    return self.allPostList[row].re_author;
}

- (NSString *)messageForRow:(NSInteger)row {
    return self.allPostList[row].msg;
}

- (BOOL)isHaveSentToUserForRow:(NSInteger)row {
    return ([self.allPostList[row].re_author isEqualToString:@""]) ? NO : YES;
}

#pragma mark - LazyLoad

- (instancetype)initWithUserID:(NSString *)tid {
    if (self = [super init]) {
        _tid = tid;
    }
    return self;
}

- (NSInteger)page {
    if (!_page) {
        _page = 1;
    }
    return _page;
}

@end
