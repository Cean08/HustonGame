//
//  AllReplyViewController.h
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item3Cell.h"

@interface AllReplyViewController : UITableViewController

- (instancetype)initWithUserID:(NSString *)userID andCell:(Item3Cell *)cell;
@property (nonatomic) NSString  *userID;
@property (nonatomic) Item3Cell *userCell;

@end
