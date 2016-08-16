//
//  NSString+CT.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//创建一个NSURL类型的只读属性，方便对非URL类型的数据进行转换
@interface NSString (CT)
@property(nonatomic,readonly)NSURL *ct_URL;
@end
