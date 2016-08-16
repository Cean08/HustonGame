//
//  WowsgCell.h
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WowsgCell : UITableViewCell
//大区
@property (nonatomic) UILabel *serverNameLb;
//最新价
@property (nonatomic) UILabel *nowPriceLb;
//涨幅
@property (nonatomic) UILabel *roseLb;
//表头View
@property (nonatomic) UIView *headerView;



@end
