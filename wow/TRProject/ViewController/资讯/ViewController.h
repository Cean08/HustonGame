//
//  ViewController.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuWanNetWorking.h"
@interface ViewController : UITableViewController
- (instancetype)initWithMsgType:(TuWanMsgType)msgType;
@property(nonatomic)TuWanMsgType msgType;

@end

