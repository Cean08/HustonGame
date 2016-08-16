//
//  SearchCollectionViewController.m
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SearchCollectionViewController.h"
#import "ToyCell.h"
#import "DetailTableViewController.h"
#import "ToyModel.h"
@interface SearchCollectionViewController ()
@property(nonatomic) NSArray<ToyModel *> *searchList;
@end

@implementation SearchCollectionViewController
- (NSArray<ToyModel *> *)searchList {
    if(_searchList == nil) {
        _searchList = [[NSArray<ToyModel *> alloc] init];
        _searchList = self.results;
    }
    return _searchList;
}
//当传入搜索结果时就刷新界面。显示新的内容
//重写属性results的set方法，可以抓住外部对象使用点语法赋值的时机
-(void)setResults:(NSArray *)results{
    _results=results;
    [self.collectionView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[ToyCell class] forCellWithReuseIdentifier:@"toyCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.results.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ToyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"toyCell" forIndexPath:indexPath];
    //拼接字符串
    NSString *path = [NSString stringWithFormat:@"http://db.wow.tuwan.com%@",self.results[indexPath.row].Icon];
    [cell.iconIV setImageURL:path.zjt_URL];
    cell.titleLabel.text = self.results[indexPath.row].Name;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger idNumber = self.searchList[indexPath.row].ID;
    DetailTableViewController *vc = [[DetailTableViewController alloc]initWithID:idNumber];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    backButton.backgroundColor = kGlobalColor;
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 20;
    backButton.layer.masksToBounds = YES;
    
    [backButton bk_addEventHandler:^(id sender) {
        [vc dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [vc.view addSubview:backButton];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(0);
        make.centerY.equalTo(300);
        make.size.equalTo(CGSizeMake(220, 40));
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/



@end
