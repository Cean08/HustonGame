//
//  LoginCell.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell
- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.font = [UIFont systemFontOfSize:20];
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(15);
            make.centerY.equalTo(0);
        }];
    }
    return _label;
}

- (UITextField *)textField {
    if(_textField == nil) {
        _textField = [[UITextField alloc] init];
        [self.contentView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(100);
            make.width.equalTo(200);
            make.top.bottom.equalTo(0);
        }];
    }
    return _textField;
}

- (UIButton *)Btn {
    if(_Btn == nil) {
        _Btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_Btn];
        [_Btn setTintColor:[UIColor colorWithRed:46 / 255.0 green:179 / 255.0 blue:116 / 255.0 alpha:1.0]];
        _Btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
        }];
    }
    return _Btn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
