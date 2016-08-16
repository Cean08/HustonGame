//
//  AllReplyModel.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AllReplyResultModel,Postlist,AllReplyResultForumThreadlistModel,Ratelog;
@interface AllReplyModel : NSObject

@property (nonatomic, strong) AllReplyResultModel *result;
@property (nonatomic, copy  ) NSString  *msg;
@property (nonatomic, assign) NSInteger code;

@end


@interface AllReplyResultModel : NSObject

@property (nonatomic, copy  ) NSString *subject;
@property (nonatomic, copy  ) NSString *thumb;
@property (nonatomic, copy  ) NSString *displayorder;
@property (nonatomic, copy  ) NSString *digest;
@property (nonatomic, copy  ) NSString *fid;
@property (nonatomic, copy  ) NSString *count;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, copy  ) NSString *replies;
@property (nonatomic, copy  ) NSString *share_url;
@property (nonatomic, copy  ) NSString *maxposition;
@property (nonatomic, strong) NSArray<Postlist *> *postlist;
@property (nonatomic, copy  ) NSString *tid;
@property (nonatomic, strong) NSArray<AllReplyResultForumThreadlistModel *> *forum_threadlist;
@property (nonatomic, copy  ) NSString *forum_name;

@end


@interface Postlist : NSObject

@property (nonatomic, copy  ) NSString  *invisible;
@property (nonatomic, copy  ) NSString  *tid;
@property (nonatomic, copy  ) NSString  *anonymous;
@property (nonatomic, copy  ) NSString  *status;
@property (nonatomic, copy  ) NSString  *first;
@property (nonatomic, assign) NSInteger authorid;
@property (nonatomic, copy  ) NSString  *good;
@property (nonatomic, copy  ) NSString  *video;
@property (nonatomic, copy  ) NSString  *re_authorid;
@property (nonatomic, copy  ) NSString  *ratetimes;
@property (nonatomic, copy  ) NSString  *datetime;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy  ) NSString  *bad;
@property (nonatomic, copy  ) NSString  *dateline;
@property (nonatomic, strong) NSArray   *ratelog;
@property (nonatomic, copy  ) NSString  *attachments;
@property (nonatomic, copy  ) NSString  *re_author;
@property (nonatomic, copy  ) NSString  *avatar;
@property (nonatomic, copy  ) NSString  *pid;
@property (nonatomic, copy  ) NSString  *rate;
@property (nonatomic, copy  ) NSString  *author;
@property (nonatomic, copy  ) NSString  *msg;

@end


@interface AllReplyResultForumThreadlistModel : NSObject

@property (nonatomic, copy  ) NSString  *tid;
@property (nonatomic, copy  ) NSString  *anonymous;
@property (nonatomic, assign) NSInteger replies;
@property (nonatomic, copy  ) NSString  *status;
@property (nonatomic, copy  ) NSString  *first;
@property (nonatomic, copy  ) NSString  *authorface;
@property (nonatomic, assign) NSInteger authorid;
@property (nonatomic, copy  ) NSString  *good;
@property (nonatomic, copy  ) NSString  *video;
@property (nonatomic, copy  ) NSString  *re_authorid;
@property (nonatomic, copy  ) NSString  *ratetimes;
@property (nonatomic, copy  ) NSString  *datetime;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, copy  ) NSString  *bad;
@property (nonatomic, copy  ) NSString  *dateline;
@property (nonatomic, strong) NSArray<Ratelog *> *ratelog;
@property (nonatomic, copy  ) NSString  *message;
@property (nonatomic, copy  ) NSString  *re_author;
@property (nonatomic, copy  ) NSString  *attach;
@property (nonatomic, copy  ) NSString  *pid;
@property (nonatomic, copy  ) NSString  *rate;
@property (nonatomic, copy  ) NSString  *author;
@property (nonatomic, copy  ) NSString  *invisible;

@end


@interface Ratelog : NSObject

@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, copy) NSString *dateline;

@end

