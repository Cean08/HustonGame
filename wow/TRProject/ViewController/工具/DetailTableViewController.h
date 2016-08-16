//
//  DetailTableViewController.h
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController
-(instancetype)initWithID:(NSInteger)ID;
@property(nonatomic)NSInteger ID;
@end
