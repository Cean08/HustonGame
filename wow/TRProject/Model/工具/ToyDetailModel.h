//
//  DetailModel.h
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToyDetailModel : NSObject

@property (nonatomic, copy) NSString *Quality;

@property (nonatomic, copy) NSString *Description;

@property (nonatomic, copy) NSString *Get;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *IsUnique;

@property (nonatomic, copy) NSString *SubClassName;

@property (nonatomic, copy) NSString *ClassName;

@property (nonatomic, copy) NSString *Title;

@property (nonatomic, assign) NSInteger Level;

@property (nonatomic, copy) NSString *Icon;

@property (nonatomic, assign) NSInteger ReqLevel;

@property (nonatomic, copy) NSString *Spell;

@end
