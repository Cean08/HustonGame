//
//  TuWanItem3Model.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/20.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Result,Forum_Threadlist,Attach;
@interface TuWanItem3Model : NSObject

@property (nonatomic, strong) Result    *result;
@property (nonatomic, copy  ) NSString  *msg;
@property (nonatomic, assign) NSInteger code;

@end


@interface Result : NSObject

//@property (nonatomic, strong) NSArray<Sublist *> *sublist;
@property (nonatomic, copy  ) NSString  *apiurl;
@property (nonatomic, copy  ) NSString  *attentions;
@property (nonatomic, copy  ) NSString  *posts;
@property (nonatomic, assign) NSInteger messages;
@property (nonatomic, strong) NSArray   *type;
@property (nonatomic, copy  ) NSString  *avatar;
@property (nonatomic, copy  ) NSString  *threads;
@property (nonatomic, copy  ) NSString  *banner;
@property (nonatomic, copy  ) NSString  *todayposts;
@property (nonatomic, strong) NSArray<Forum_Threadlist *> *forum_threadlist;
@property (nonatomic, copy  ) NSString  *ico;
@property (nonatomic, copy  ) NSString  *forum_name;

@end


//@interface Sublist : NSObject
//
//@property (nonatomic, copy) NSString *posts;
//@property (nonatomic, copy) NSString *fid;
//@property (nonatomic, copy) NSString *todayposts;
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *threads;
//
//@end


@interface Forum_Threadlist : NSObject

@property (nonatomic, copy  ) NSString *cut;
@property (nonatomic, copy  ) NSString *tid;
@property (nonatomic, copy  ) NSString *forumname;
@property (nonatomic, copy  ) NSString *replies;
@property (nonatomic, copy  ) NSString *url;
@property (nonatomic, copy  ) NSString *fid;
@property (nonatomic, copy  ) NSString *authorface;
@property (nonatomic, copy  ) NSString *subject;
@property (nonatomic, copy  ) NSString *views;
@property (nonatomic, copy  ) NSString *authorid;
@property (nonatomic, copy  ) NSString *good;
@property (nonatomic, strong) NSArray  *postlist;
@property (nonatomic, copy  ) NSString *lastpost;
@property (nonatomic, copy  ) NSString *ratetimes;
@property (nonatomic, copy  ) NSString *lastposttime;
@property (nonatomic, copy  ) NSString *bad;
@property (nonatomic, copy  ) NSString *dateline;
@property (nonatomic, strong) NSArray  *ratelog;
@property (nonatomic, copy  ) NSString *message;
@property (nonatomic, copy  ) NSString *datelinetime;
@property (nonatomic, strong) NSArray  <Attach *> *attach;
@property (nonatomic, copy  ) NSString *displayorder;
@property (nonatomic, copy  ) NSString *rate;
@property (nonatomic, copy  ) NSString *attentions;
@property (nonatomic, copy  ) NSString *author;
@property (nonatomic, copy  ) NSString *digest;

@end


@interface Attach : NSObject

@property (nonatomic, copy) NSString *url;

@end

