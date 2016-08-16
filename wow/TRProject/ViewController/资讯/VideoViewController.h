//
//  VideoViewController.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController
@property(nonatomic,readonly)NSString *aid;
- (instancetype)initWithAid:(NSString *)aid;
@end
