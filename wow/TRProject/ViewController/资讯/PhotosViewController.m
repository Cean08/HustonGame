//
//  PhotosViewController.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PhotosViewController.h"

@interface PhotosViewController ()<MWPhotoBrowserDelegate>
@property(nonatomic) PhotoViewModel *photoVM;
@end

@implementation PhotosViewController
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
- (PhotoViewModel *)photoVM{
    if (!_photoVM) {
        _photoVM = [[PhotoViewModel alloc] initWithAid:_aid];
    }
    return _photoVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    [self.view showHUD];
    [self.photoVM getDataWithMode:RequestModeMore  completionHandler:^(NSError *error) {
        [self.view hideHUD];
        [self reloadData];
    }];
//    [self.photoVM getRequestModel:RequestModelMore completionHandler:^(NSError *error) {
//        [self.view hideHUD];
//        [self reloadData];
//    }];
    // Do any additional setup after loading the view.
}
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.photoVM.rowNumber;
    
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.photoVM iconURL:index]];
    
    return photo;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
