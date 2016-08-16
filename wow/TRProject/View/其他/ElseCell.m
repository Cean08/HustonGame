//
//  ElseCell.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ElseCell.h"

@implementation ElseCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.width.equalTo(40);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _titleLB.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(10);
            make.centerY.equalTo(0);
        }];
    }
    return _titleLB;
}

- (UILabel *)loginLB {
    if(_loginLB == nil) {
        _loginLB = [[UILabel alloc] init];
        _titleLB.textAlignment = NSTextAlignmentLeft;
        _loginLB.font = [UIFont systemFontOfSize:20];
        _loginLB.textColor = kGlobalColor;
        [self.contentView addSubview:_loginLB];
        [_loginLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(120);
            make.centerY.equalTo(0);
        }];
    }
    return _loginLB;
}

@end
