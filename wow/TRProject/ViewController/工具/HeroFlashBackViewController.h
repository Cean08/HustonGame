//
//  HeroFlashBackViewController.h
//  TRProject
//
//  Created by Cean on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroFlashBackViewController : UITableViewController
//接收ToolPageVC传过来切换控制器的索引值
@property (nonatomic, readonly)NSInteger fbType;
- (instancetype)initWithFbType:(NSInteger)fbType;
@end
