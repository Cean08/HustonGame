//
//  Item3Cell.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/21.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "Item3Cell.h"

@implementation Item3Cell

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
        
        [self replyButton];
        [self allReplyButton];
        [self moreButton];
        [self zanButton];
    }
    return self;
}

#pragma mark - LazyLoad

- (UIImageView *)headerIV {
    if(_headerIV == nil) {
        _headerIV = [[UIImageView alloc] init];
        
        _headerIV.layer.cornerRadius  = 20;
        _headerIV.layer.masksToBounds = YES;
        _headerIV.layer.borderColor   = kGlobalColor.CGColor;
        _headerIV.layer.borderWidth   = 1;
        
        [self.contentView addSubview:_headerIV];
        
        [_headerIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(20);
            make.left.equalTo(10);
            make.width.height.equalTo(40);
        }];
    }
    return _headerIV;
}

- (UILabel *)userNameLB {
    if(_userNameLB == nil) {
        _userNameLB = [[UILabel alloc] init];
        
        _userNameLB.font          = [UIFont systemFontOfSize:16];
        _userNameLB.textColor     = [UIColor colorWithRed:30 / 255.0 green:170 / 255.0 blue:100 / 255.0 alpha:1];
        _userNameLB.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_userNameLB];
        
        [_userNameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.headerIV.mas_right).equalTo(10);
            make.centerY.equalTo(self.headerIV);
        }];
    }
    return _userNameLB;
}

- (UILabel *)timeLB {
    if(_timeLB == nil) {
        _timeLB = [[UILabel alloc] init];
        
        _timeLB.textAlignment = NSTextAlignmentRight;
        _timeLB.font          = [UIFont systemFontOfSize:14];
        _timeLB.textColor     = [UIColor lightGrayColor];
        
        [self.contentView addSubview:_timeLB];
        
        [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerY.equalTo(self.headerIV);
            make.right.equalTo(-10);
            make.left.greaterThanOrEqualTo(self.userNameLB.mas_right).offset(8);
        }];
    }
    return _timeLB;
}

- (UIImageView *)postImageIV {
    if(_postImageIV == nil) {
        _postImageIV = [[UIImageView alloc] init];
        
        _postImageIV.contentMode            = UIViewContentModeScaleAspectFit;
        _postImageIV.layer.masksToBounds    = YES;
        _postImageIV.userInteractionEnabled = YES;
        
        [_postImageIV sizeToFit];
        
        [self.contentView addSubview:_postImageIV];
        
        [_postImageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.headerIV);
            make.top.equalTo(self.userNameLB.mas_bottom).equalTo(16);
        }];
    }
    return _postImageIV;
}


- (UILabel *)messageLB {
    if(_messageLB == nil) {
        _messageLB = [[UILabel alloc] init];
        
        _messageLB.font          = [UIFont systemFontOfSize:16];
        _messageLB.numberOfLines = 0;
        
        [self.contentView addSubview:_messageLB];
        
        [_messageLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.headerIV);
            make.top.equalTo(self.postImageIV.mas_bottom).equalTo(10);
            make.right.equalTo(-10);
        }];
    }
    return _messageLB;
}

- (UILabel *)replyLB {
    if(_replyLB == nil) {
        _replyLB = [[UILabel alloc] init];
        
        _replyLB.textAlignment = NSTextAlignmentLeft;
        _replyLB.font          = [UIFont systemFontOfSize:16];
        _replyLB.textColor     = [UIColor grayColor];
        
        [self.contentView addSubview:_replyLB];
        
        [_replyLB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(self.messageLB);
            make.top.equalTo(self.messageLB.mas_bottom).equalTo(8);
            make.right.greaterThanOrEqualTo(8);
        }];
    }
    return _replyLB;
}

- (UIButton *)zanButton {
    if(_zanButton == nil) {
        _zanButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_zanButton setTitle:@"点赞" forState:UIControlStateNormal];
        [_zanButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_zanButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_zanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _zanButton.titleLabel.font          = [UIFont systemFontOfSize:14];
        _zanButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _zanButton.backgroundColor          = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        _zanButton.layer.cornerRadius       = 4;
        
        [self.contentView addSubview:_zanButton];
        
        [_zanButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.replyLB.mas_bottom).equalTo(8);
            make.left.equalTo(self.replyLB);
            make.height.equalTo(24);
            make.width.equalTo(42);
            make.bottom.equalTo(-20);
        }];
    }
    return _zanButton;
}

- (UIButton *)replyButton {
    if(_replyButton == nil) {
        _replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
        [_replyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_replyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _replyButton.titleLabel.font          = [UIFont systemFontOfSize:14];
        _replyButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _replyButton.backgroundColor          = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        _replyButton.layer.cornerRadius       = 4;
        
        [self.contentView addSubview:_replyButton];
        
        [_replyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.zanButton);
            make.left.equalTo(self.zanButton.mas_right).equalTo(10);
            make.height.equalTo(self.zanButton);
            make.width.equalTo(42);
        }];
    }
    return _replyButton;
}

- (UIButton *)allReplyButton {
    if(_allReplyButton == nil) {
        _allReplyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_allReplyButton setTitle:@"全部回复" forState:UIControlStateNormal];
        [_allReplyButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_allReplyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _allReplyButton.titleLabel.font          = [UIFont systemFontOfSize:14];
        _allReplyButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _allReplyButton.backgroundColor          = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        _allReplyButton.layer.cornerRadius       = 4;
        
        [_allReplyButton bk_addEventHandler:^(id sender) {
            _block(self);
        } forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_allReplyButton];
        
        [_allReplyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.replyButton);
            make.left.equalTo(self.replyButton.mas_right).equalTo(10);
            make.height.equalTo(self.zanButton);
            make.width.equalTo(68);
        }];
    }
    return _allReplyButton;
}

- (UIButton *)moreButton {
    if(_moreButton == nil) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_moreButton setTitle:@"•••" forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        _moreButton.titleLabel.font          = [UIFont systemFontOfSize:14];
        _moreButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _moreButton.backgroundColor          = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1];
        _moreButton.layer.cornerRadius       = 4;
        
        [self.contentView addSubview:_moreButton];
        
        [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.replyButton);
            make.left.greaterThanOrEqualTo(self.replyButton.mas_right).offset(8);
            make.height.equalTo(self.zanButton);
            make.width.equalTo(44);
            make.right.equalTo(self.timeLB);
        }];
    }
    return _moreButton;
}

@end
