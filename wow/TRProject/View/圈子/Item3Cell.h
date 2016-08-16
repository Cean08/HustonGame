//
//  Item3Cell.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/21.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Item3Cell : UITableViewCell

@property (nonatomic) UIImageView *headerIV;
@property (nonatomic) UILabel     *userNameLB;
@property (nonatomic) UILabel     *messageLB;
@property (nonatomic) UIImageView *postImageIV;
@property (nonatomic) UILabel     *timeLB;
@property (nonatomic) UILabel     *replyLB;
@property (nonatomic) UIButton    *zanButton;
@property (nonatomic) UIButton    *replyButton;
@property (nonatomic) UIButton    *allReplyButton;
@property (nonatomic) UIButton    *moreButton;

@property (nonatomic, copy) void(^block)(Item3Cell *cell);

@end
