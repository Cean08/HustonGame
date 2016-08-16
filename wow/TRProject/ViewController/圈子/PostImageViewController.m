//
//  PostImageViewController.m
//  TRProject
//
//  Created by tarena11 on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "PostImageViewController.h"

@interface PostImageViewController ()<MWPhotoBrowserDelegate>

@end

@implementation PostImageViewController

#pragma mark - LifeCycle (生命周期)

- (id)initWithImageURL:(NSURL *)imageURL {
    if (self = [super init]) {
        _imageURL = imageURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    
    [self reloadData];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return 1;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    MWPhoto *photo = [MWPhoto photoWithURL:_imageURL];
    
    return photo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
