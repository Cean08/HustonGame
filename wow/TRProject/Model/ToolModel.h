//
//  ToolModel.h
//  TRProject
//
//  Created by Cean on 16/7/20.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
//工具栏首页
@interface ToolModel : NSObject
//标题key
@property (nonatomic, copy) NSString *key;
//图片url
@property (nonatomic, copy) NSString *img;
//详情页url
@property (nonatomic, copy) NSString *url;
//更新时间，单位：秒
@property (nonatomic, assign) NSInteger pubdate;

@end

