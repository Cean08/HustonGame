//
//  ToolViewModel.h
//  TRProject
//
//  Created by Cean on 16/7/20.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetManager.h"
#import "BaseViewModel.h"

@interface ToolViewModel : BaseViewModel
//工具首页
//行数
@property (nonatomic) NSInteger rowNumber;
//每行图片地址
- (NSURL *)iconURL:(NSInteger)row;
//更新的时间
- (NSString *)time:(NSInteger)row;

//存放ToolModel数据
@property (nonatomic) NSArray<ToolModel *> *toolData;


@end
