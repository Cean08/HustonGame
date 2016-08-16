//
//  BaseViewModel.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/14.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BaseViewModel.h"



@interface CircleViewModel : BaseViewModel

@property (nonatomic) NSInteger threadsNumber;
@property (nonatomic) NSInteger postsNumber;

@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)headerImageForRow:(NSInteger)row;
- (NSString *)userNameForRow:(NSInteger)row;
- (NSString *)timeForRow:(NSInteger)row;
- (NSURL *)postImageForRow:(NSInteger)row;
- (NSString *)messageForRow:(NSInteger)row;
- (NSString *)replyForRow:(NSInteger)row;
- (NSString *)userIDForRow:(NSInteger)row;

@property (nonatomic) NSInteger page;

@property (nonatomic) NSMutableArray<Forum_Threadlist *> *tuWanItem3DataList;


@end
