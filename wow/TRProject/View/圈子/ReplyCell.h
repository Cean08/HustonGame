//
//  ReplyCell.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyCell : UITableViewCell

@property (nonatomic) UIImageView *userIV;
@property (nonatomic) UILabel     *userNameLB;
@property (nonatomic) UIButton    *zanButton;
@property (nonatomic) UIButton    *sentUserButton;
@property (nonatomic) UIButton    *sentToUserButton;
@property (nonatomic) UILabel     *replyTextLB;
@property (nonatomic) UILabel     *replyMessageLB;

@end
