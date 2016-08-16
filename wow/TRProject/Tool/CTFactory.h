//
//  CTFactory.h
//  TRProject
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTFactory : NSObject
//自动为控制器添加右上角的搜索按钮UI
+ (void)addSearchItemForVC:(UIViewController *)vc clickedHandler:(void(^)())handler;
@end
