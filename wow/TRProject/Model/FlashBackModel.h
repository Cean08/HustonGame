//
//  FlashBackModel.h
//  TRProject
//
//  Created by Cean on 16/7/22.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

//@class Esarray;
@interface FlashBackModel : NSObject

//@property (nonatomic, strong) NSArray<Esarray *> *esArray;
//@end
//@interface Esarray : NSObject

//id -> identity
@property (nonatomic, assign) NSInteger identity;

@property (nonatomic, copy) NSString *playername;

@property (nonatomic, copy) NSString *total;

@property (nonatomic, copy) NSString *fight;

@property (nonatomic, copy) NSString *ranktier;

@property (nonatomic, assign) CGFloat tianti_pro;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *win;

@property (nonatomic, copy) NSString *tianti_total;

@property (nonatomic, copy) NSString *tianti_mmr;

@property (nonatomic, copy) NSString *tianti_fight;

@property (nonatomic, copy) NSString *tianti_win;

@property (nonatomic, copy) NSString *mmr;

@end

