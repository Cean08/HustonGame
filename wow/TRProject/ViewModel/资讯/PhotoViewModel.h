//
//  PhotoViewModel.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoAndPicModel.h"
#import "TuWanNetWorking.h"
@interface PhotoViewModel : BaseViewModel
//UI
@property(nonatomic,readonly) NSInteger rowNumber;
- (NSURL *)iconURL:(NSInteger)row;

//Model
- (instancetype) initWithAid:(NSString *)aid;
@property(nonatomic,readonly) NSString *aid;
@property(nonatomic) VideoAndPicModel *model;
@end
