//
//  PhotosViewController.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>
#import "PhotoViewModel.h"
@interface PhotosViewController : MWPhotoBrowser
- (instancetype)initWithAid:(NSString *)aid;
@property (nonatomic,readonly) NSString *aid;
@end
