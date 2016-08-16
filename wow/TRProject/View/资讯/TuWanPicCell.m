//
//  TuWanPicCell.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanPicCell.h"

@implementation TuWanPicCell


- (NSMutableArray<UIImageView *> *)iconList {
    if(_iconList == nil) {
        _iconList = [[NSMutableArray<UIImageView *> alloc] init];
        CGFloat width =(long)(([UIScreen mainScreen].bounds.size.width-4*6)/3);
        for (int i = 0; i<3; i++) {
            UIImageView *iv = [UIImageView new];
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.clipsToBounds = YES;
            [self.contentView addSubview:iv];
            CGFloat x = 8*(i+1) +i*width;
            [iv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.equalTo(width);
                make.top.equalTo(self.titleLb.mas_bottom).equalTo(5);
                make.bottom.equalTo(-5);
                make.left.equalTo(x);
            }];
            [_iconList addObject:iv];
        }}
        return _iconList;
        }
     
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView  addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(5);
        }];
    }
    return _titleLb;
}

- (UILabel *)clickLb {
    if(_clickLb == nil) {
        _clickLb = [[UILabel alloc] init];
        [self.contentView addSubview:_clickLb];
        [_clickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLb);
            make.right.equalTo(-8);
            
        }];
        _clickLb.font = [UIFont systemFontOfSize:14];
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
