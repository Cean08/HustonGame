//
//  HearoModel.h
//  TRProject
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HearoDataModel;
@interface HearoModel : NSObject

//@property (nonatomic, strong) NSArray<HearoDataModel *> *esArray;
//
//@end
//@interface HearoDataModel : NSObject

@property (nonatomic, copy) NSString *Alias;

@property (nonatomic, copy) NSString *Initial;

@property (nonatomic, copy) NSString *Type;

@property (nonatomic, copy) NSString *Name;

@property (nonatomic, copy) NSString *Img;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *Game;

@end

