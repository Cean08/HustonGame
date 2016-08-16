//
//  HearoViewController.m
//  TRProject
//
//  Created by tarena11 on 16/8/1.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HearoViewController.h"
#import "NetManager.h"
#import "HearoCell.h"
#import "HearoViewModel.h"

@import AVFoundation;

@interface HearoViewController ()
@property(nonatomic) HearoViewModel *hearoVM;

@end

@implementation HearoViewController

- (HearoViewModel *)hearoVM {
    if (_hearoVM == nil) {
        _hearoVM = [HearoViewModel new];
    }
    return _hearoVM;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"英雄库";
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = kGlobalColor;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UIColor *whiteTitle = kGlobalColor;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:whiteTitle forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    [NetManager getHearoDataCompletionHandler:^(NSArray<HearoModel *> *model, NSError *error) {
        self.hearoVM.dataList = model;
        [self.collectionView reloadData];
    }];
    
    [self.collectionView registerClass:[HearoCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.hearoVM.rowNUmber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HearoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.img setImageURL:[self.hearoVM imgURL:indexPath.row]];
    cell.gameLB.text = [self.hearoVM gameLB:indexPath.row];
    cell.nameLB.text = [self.hearoVM nameLB:indexPath.row];
    
    return cell;
}

@end
