//
//  PostImageViewController.h
//  TRProject
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface PostImageViewController : MWPhotoBrowser

- initWithImageURL:(NSURL *)imageURL;
@property (nonatomic) NSURL *imageURL;

@end
