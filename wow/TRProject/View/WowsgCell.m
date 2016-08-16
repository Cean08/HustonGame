//
//  WowsgCell.m
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "WowsgCell.h"

@implementation WowsgCell
#pragma mark - LazyLoad

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (UILabel *)serverNameLb {
    if(_serverNameLb == nil) {
        _serverNameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_serverNameLb];
        _serverNameLb.textAlignment = NSTextAlignmentCenter;
        
        [_serverNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
            make.width.equalTo((kScreenW - 80) / 3.0);
        }];
    }
    return _serverNameLb;
}

- (UILabel *)nowPriceLb {
    if(_nowPriceLb == nil) {
        _nowPriceLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nowPriceLb];
        _nowPriceLb.textAlignment = NSTextAlignmentCenter;

        [_nowPriceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(0);
            make.width.equalTo(self.serverNameLb);
        }];
    }
    return _nowPriceLb;
}

- (UILabel *)roseLb {
    if(_roseLb == nil) {
        _roseLb = [[UILabel alloc] init];
        [self.contentView addSubview:_roseLb];
        _roseLb.textAlignment = NSTextAlignmentCenter;
        _roseLb.textColor = [UIColor whiteColor];
        _roseLb.layer.cornerRadius = 4;
        _roseLb.layer.masksToBounds = YES;
        
        [_roseLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-20);
            make.width.equalTo(self.serverNameLb);
        }];
    }
    return _roseLb;
}

- (UIView *)headerView {
    if(_headerView == nil) {
        //要给view设置高度，否则显示不出来
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 60)];
        _headerView.backgroundColor = [UIColor clearColor];
        
        UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:@[@"大区", @"最新价", @"涨幅"]];
#pragma  待解决字体颜色
        //不可交互，交互关闭，就变浅灰色，再设置字体颜色无效
//        segmented.enabled = NO;
        segmented.tintColor = [UIColor grayColor];
//        segmented.layer.borderColor = [UIColor grayColor].CGColor;
//        segmented.layer.borderWidth = 2;
        
        //修改字体的默认颜色和大小
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:20], NSFontAttributeName,nil];
        [segmented setTitleTextAttributes:dic forState:UIControlStateNormal];
        
        
        [_headerView addSubview:segmented];
        [segmented mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
    }
    return _headerView;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
