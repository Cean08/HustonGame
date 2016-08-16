//
//  ReplyCell.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "ReplyCell.h"

@implementation ReplyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.separatorInset                  = UIEdgeInsetsZero;
        self.layoutMargins                   = UIEdgeInsetsZero;
        self.preservesSuperviewLayoutMargins = NO;
        
        [self zanButton];
    }
    return self;
}

#pragma mark - LazyLoad

- (UIImageView *)userIV {
    if(_userIV == nil) {
        _userIV = [[UIImageView alloc] init];
        
        _userIV.layer.cornerRadius  = 15;
        _userIV.layer.masksToBounds = YES;
        
        [self.contentView addSubview:_userIV];
        
        [_userIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.left.equalTo(10);
            make.width.height.equalTo(30);
        }];
    }
    return _userIV;
}

- (UILabel *)userNameLB {
    if(_userNameLB == nil) {
        _userNameLB = [[UILabel alloc] init];
        
        _userNameLB.font          = [UIFont systemFontOfSize:16];
        _userNameLB.textColor     = [UIColor colorWithRed:30 / 255.0 green:170 / 255.0 blue:100 / 255.0 alpha:1];
        _userNameLB.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_userNameLB];
        
        [_userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.userIV.mas_right).equalTo(10);
            make.centerY.equalTo(self.userIV);
        }];
    }
    return _userNameLB;
}

- (UIButton *)zanButton {
    if(_zanButton == nil) {
        _zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_zanButton setImage:[UIImage imageNamed:@"icon_comment_like_16x16_"] forState:UIControlStateNormal];
        [_zanButton setImage:[UIImage imageNamed:@"icon_comment_hot_like_16x16_"] forState:UIControlStateSelected];
        
        [self.contentView addSubview:_zanButton];
        
        [_zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.userNameLB.mas_top);
            make.left.greaterThanOrEqualTo(self.userNameLB.mas_right).offset(8);
            make.right.equalTo(-10);
        }];
    }
    return _zanButton;
}

- (UIButton *)sentUserButton {
    if(_sentUserButton == nil) {
        _sentUserButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_sentUserButton setTitleColor:[UIColor colorWithRed:30 / 255.0 green:170 / 255.0 blue:100 / 255.0 alpha:1] forState:UIControlStateNormal];
        
        [self.contentView addSubview:_sentUserButton];
        
        [_sentUserButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.userIV);
            make.top.equalTo(self.userIV.mas_bottom).equalTo(10);
            make.bottom.equalTo(-10);
        }];
    }
    return _sentUserButton;
}

- (UILabel *)replyTextLB {
    if(_replyTextLB == nil) {
        _replyTextLB = [[UILabel alloc] init];
        
        _replyTextLB.font = [UIFont systemFontOfSize:14];
        _replyTextLB.text = @"回复";
        
        [self.contentView addSubview:_replyTextLB];
        
        [_replyTextLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(10);
            make.top.equalTo(self.userIV.mas_bottom).equalTo(10);
        }];
    }
    return _replyTextLB;
}

- (UIButton *)sentToUserButton {
    if(_sentToUserButton == nil) {
        _sentToUserButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_sentToUserButton setTitleColor:[UIColor colorWithRed:30 / 255.0 green:170 / 255.0 blue:100 / 255.0 alpha:1] forState:UIControlStateNormal];
        _sentToUserButton.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [self.contentView addSubview:_sentToUserButton];
        
        [_sentToUserButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.replyTextLB.mas_right).equalTo(2);
            make.centerY.equalTo(self.replyTextLB);
            make.right.equalTo(self.replyMessageLB.mas_left).equalTo(-4);
        }];
    }
    return _sentToUserButton;
}

- (UILabel *)replyMessageLB {
    if(_replyMessageLB == nil) {
        _replyMessageLB = [[UILabel alloc] init];
        
        _replyMessageLB.textAlignment = NSTextAlignmentLeft;
        _replyMessageLB.font          = [UIFont systemFontOfSize:14];
        _replyMessageLB.textColor     = [UIColor darkGrayColor];
        _replyMessageLB.numberOfLines = 0;
        
        [self.contentView addSubview:_replyMessageLB];
        
        [_replyMessageLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.greaterThanOrEqualTo(10);
            make.top.equalTo(self.userIV.mas_bottom).equalTo(10);
            make.bottom.equalTo(-10);
            make.right.lessThanOrEqualTo(-10);
        }];
    }
    return _replyMessageLB;
}

@end
