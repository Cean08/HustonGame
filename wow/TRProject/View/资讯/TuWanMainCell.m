//
//  TuWanMainCell.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanMainCell.h"

@implementation TuWanMainCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        _iconIV.layer.cornerRadius = 6;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(8);
//            make.width.height.equalTo(80);
            make.size.equalTo(CGSizeMake(80, 80));
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(8);
            make.top.equalTo(self.iconIV);
            make.right.equalTo(-8);
        }];
    }
    return _titleLb;
}

- (UILabel *)detailLb {
    if(_detailLb == nil) {
        _detailLb = [[UILabel alloc] init];
        _detailLb.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_detailLb];
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLb);
            make.right.equalTo(self.titleLb);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(5);
            make.height.lessThanOrEqualTo(35);
        }];
        _detailLb.numberOfLines = 0;
        _detailLb.textColor = [UIColor grayColor];
    }
    return _detailLb;
}

- (UILabel *)clickLb {
    if(_clickLb == nil) {
        _clickLb = [[UILabel alloc] init];
        [self.contentView addSubview:_clickLb];
        [_clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.detailLb);
            make.bottom.equalTo(self.iconIV);
        }];
        _clickLb.font = [UIFont systemFontOfSize:13];
        _clickLb.textAlignment = NSTextAlignmentLeft;
        _clickLb.textColor = [UIColor grayColor];
    }
    return _clickLb;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
