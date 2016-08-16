//
//  FlashBackViewController.h
//  TRProject
//
//  Created by Cean on 16/7/26.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashBackViewModel.h"

@interface FlashBackViewController : UITableViewController
//跳转到该界面需要传入的请求网络数据类型的索引值
@property (nonatomic)FlashBackType fbType;
- (instancetype)initWithFbType:(FlashBackType)fbType;
@end
