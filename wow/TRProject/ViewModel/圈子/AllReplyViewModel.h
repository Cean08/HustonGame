//
//  AllReplyViewModel.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"



@interface AllReplyViewModel : BaseViewModel

- (instancetype)initWithUserID:(NSString *)tid;
@property (nonatomic, readonly) NSString *tid;

@property (nonatomic) NSURL    *headerUserImage;
@property (nonatomic) NSString *headerUserName;
@property (nonatomic) NSString *headerTime;
@property (nonatomic) NSURL    *headerPostImage;
@property (nonatomic) NSString *headerMessage;

@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)userImageForRow:(NSInteger)row;
- (NSString *)sentUserNameForRow:(NSInteger)row;
- (NSString *)sentToUserNamenForRow:(NSInteger)row;
- (NSString *)messageForRow:(NSInteger)row;
- (BOOL)isHaveSentToUserForRow:(NSInteger)row;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSString *userID;

@property (nonatomic) NSMutableArray<Postlist *> *allPostList;

@end
