//
//  FlashBackCell.h
//  TRProject
//
//  Created by Cean on 16/7/26.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashBackCell : UITableViewCell
//显示图片
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
//排名的label
@property (weak, nonatomic) IBOutlet UILabel *rankLb;
//昵称的label
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
//具体MMR的值
@property (weak, nonatomic) IBOutlet UILabel *mmrLb;
//战斗力值得label
@property (weak, nonatomic) IBOutlet UILabel *fightingLb;
//具体胜率
@property (weak, nonatomic) IBOutlet UILabel *winRateLb;
//录像数量
@property (weak, nonatomic) IBOutlet UILabel *videoCountLb;
//具体的头衔
@property (weak, nonatomic) IBOutlet UILabel *honourLb;


@end
