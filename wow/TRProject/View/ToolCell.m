//
//  ToolCell.m
//  TRProject
//
//  Created by Cean on 16/7/20.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ToolCell.h"

@implementation ToolCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        //添加边框和边框颜色
        _iconIV.layer.borderWidth = 6;
        _iconIV.layer.borderColor = kColorRGB(201, 201, 201, 1.0).CGColor;
        _iconIV.layer.cornerRadius = 5;
        _iconIV.layer.masksToBounds = YES;
        
        //图片宽高比 573*204
        CGFloat height = (kScreenW - 2 * 10) * 204 / 573.0;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(4);
            make.height.equalTo(height);
        }];
    }
    return _iconIV;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.backgroundColor = kColorRGB(201, 201, 201, 1.0);
        _timeLb.textAlignment = NSTextAlignmentCenter;
       //圆角
        _timeLb.layer.cornerRadius = 2;
        _timeLb.layer.masksToBounds = YES;
        
        //若确定高度，则约束冲突
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconIV.mas_bottom);
            make.right.equalTo(-20);
            make.bottom.equalTo(-4);
            make.width.equalTo(154);
        }];
    }
    return _timeLb;
}

@end
