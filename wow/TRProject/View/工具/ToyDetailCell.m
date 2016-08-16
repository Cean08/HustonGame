//
//  DetailCell.m
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ToyDetailCell.h"

@implementation ToyDetailCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(22);
            make.size.equalTo(CGSizeMake(60, 60));
        }];
    }
    return _iconIV;
}





- (UIView *)blackView {
    if(_blackView == nil) {
        _blackView = [[UIView alloc] init];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0.75;
        [self.contentView addSubview:_blackView];
        [_blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV);
            make.left.equalTo(self.iconIV.mas_right).equalTo(20);
            make.right.equalTo(-20);
        }];
    }
    return _blackView;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.textColor = [UIColor blueColor];
        _titleLB.font = [UIFont systemFontOfSize:18];
        [self.blackView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20);
            make.left.equalTo(15);
        }];
    }
    return _titleLB;
}

- (UILabel *)levelLB {
    if(_levelLB == nil) {
        _levelLB = [[UILabel alloc] init];
        _levelLB.textColor = [UIColor yellowColor];
        _levelLB.font = [UIFont systemFontOfSize:16];
        [self.blackView addSubview:_levelLB];
        [_levelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB);
            make.top.equalTo(self.titleLB.mas_bottom).equalTo(18);
        }];
    }
    return _levelLB;
}

- (UILabel *)qualityLB {
    if(_qualityLB == nil) {
        _qualityLB = [[UILabel alloc] init];
        _qualityLB.textColor = [UIColor whiteColor];
        _qualityLB.font = [UIFont systemFontOfSize:16];
        [self.blackView addSubview:_qualityLB];
        [_qualityLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.levelLB.mas_bottom).equalTo(6);
            make.left.equalTo(self.titleLB);
        }];
        
    }
    return _qualityLB;
}

- (UILabel *)reqLevelLB {
    if(_reqLevelLB == nil) {
        _reqLevelLB = [[UILabel alloc] init];
        _reqLevelLB.textColor = [UIColor whiteColor];
        _reqLevelLB.font = [UIFont systemFontOfSize:16];
        [self.blackView addSubview:_reqLevelLB];
        [_reqLevelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB);
            make.top.equalTo(self.qualityLB.mas_bottom).equalTo(6);
        }];
    }
    return _reqLevelLB;
}

- (UILabel *)spellLB {
    if(_spellLB == nil) {
        _spellLB = [[UILabel alloc] init];
        _spellLB.textColor = kGlobalColor;
        _spellLB.font = [UIFont systemFontOfSize:18];
        _spellLB.numberOfLines = 0;
        [self.blackView addSubview:_spellLB];
        [_spellLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLB);
            make.top.equalTo(self.reqLevelLB.mas_bottom).equalTo(6);
            make.right.equalTo(-5);
            make.bottom.equalTo(self.descriptionLB.mas_top).equalTo(-4);
            make.bottom.lessThanOrEqualTo(-10);
        }];
    }
    return _spellLB;
}

- (UILabel *)descriptionLB {
    if(_descriptionLB == nil) {
        _descriptionLB = [[UILabel alloc] init];
        _descriptionLB.textColor = [UIColor brownColor];
        _descriptionLB.font = [UIFont systemFontOfSize:15];
        _descriptionLB.numberOfLines = 2;
        [self.blackView addSubview:_descriptionLB];
        [_descriptionLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.spellLB.mas_bottom).equalTo(6);
            make.left.equalTo(self.titleLB);
            make.right.equalTo(-5);
            make.bottom.lessThanOrEqualTo(-10);
        }];
    }
    return _descriptionLB;
}





- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
        _label.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.blackView.mas_bottom).equalTo(2);
            make.left.right.equalTo(0);
            make.height.equalTo(40);
        }];
    }
    return _label;
}

- (UILabel *)getLB {
    if(_getLB == nil) {
        _getLB = [[UILabel alloc] init];
        _getLB.font = [UIFont systemFontOfSize:16];
        _getLB.numberOfLines = 0;
        [self.contentView addSubview:_getLB];
        [_getLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.label.mas_bottom).equalTo(4);
            make.left.equalTo(2);
            make.right.equalTo(-5);
        }];
    }
    return _getLB;
}
@end
