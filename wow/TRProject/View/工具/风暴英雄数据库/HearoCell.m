//
//  HearoCell.m
//  TRProject
//
//  Created by tarena11 on 16/8/4.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HearoCell.h"

@implementation HearoCell
- (UIImageView *)img {
    if(_img == nil) {
        _img = [[UIImageView alloc] init];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = YES;
        [self.contentView addSubview:_img];
        [_img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
        }];
    }
    return _img;
}

- (UILabel *)gameLB {
    if(_gameLB == nil) {
        _gameLB = [[UILabel alloc] init];
        _gameLB.font = [UIFont systemFontOfSize:14];
        _gameLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_gameLB];
        [_gameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLB.mas_bottom).equalTo(0);
            make.left.right.equalTo(0);
            make.bottom.equalTo(-2);
        }];
    }
    return _gameLB;
}

- (UILabel *)nameLB {
    if(_nameLB == nil) {
        _nameLB = [[UILabel alloc] init];
        _nameLB.font = [UIFont systemFontOfSize:14];
        _nameLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.img.mas_bottom).equalTo(0);
            make.left.right.equalTo(0);
        }];
    }
    return _nameLB;
}
@end
