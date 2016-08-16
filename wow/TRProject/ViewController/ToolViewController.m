//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ToolViewController.h"
#import "ToolViewModel.h"
#import "ToolCell.h"
#import "WowsgViewController.h"
#import "FlashBackViewController.h"
#import "ToolPageViewController.h"
#import "PageViewController.h"
#import "HearoViewController.h"
#import "NetManager.h"
@interface ToolViewController ()
@property (nonatomic) ToolViewModel *toolVM;
@end
@implementation ToolViewController

#pragma mark - tableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toolVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToolCellId" forIndexPath:indexPath];
    [cell.iconIV setImageURL:[self.toolVM iconURL:indexPath.row]];
    cell.timeLb.text = [self.toolVM time:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:@"ToolCellId" configuration:^(ToolCell *cell) {
        [cell.iconIV setImageURL:[self.toolVM iconURL:indexPath.row]];
        cell.timeLb.text = [self.toolVM time:indexPath.row];
    }];
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return UIStatusBarStyleDefault;
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *tmpVC = nil;
    if (indexPath.row == 0) {
        WowsgViewController *wowsgVC = [WowsgViewController new];
        tmpVC = wowsgVC;
    }
    if (indexPath.row == 1) {
        ToolPageViewController *pageVC = [ToolPageViewController new];
        pageVC.titleColorSelected = kGlobalColor;
        pageVC.titleColorNormal = kLightGreen;
        tmpVC = pageVC;
    }
    if (indexPath.row == 2) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        CGFloat width = (long)(self.view.frame.size.width - 6 * 10) / 5;
        CGFloat height = width + 32;
        layout.itemSize = CGSizeMake(width, height);
        HearoViewController *hearoVC = [[HearoViewController alloc]initWithCollectionViewLayout:layout];
        
        tmpVC = hearoVC;
    }
    if (indexPath.row == 6) {
        PageViewController *pageVC = [PageViewController new];
        //风格带横线
        pageVC.menuViewStyle = WMMenuViewStyleLine;
        //默认的颜色
        pageVC.menuBGColor = [UIColor clearColor];
        //选中的颜色
        pageVC.titleColorNormal = kLightGreen;
        //默认时的字体大小
        pageVC.titleSizeNormal = 13;
        //选中时的字体大小
        pageVC.titleSizeSelected = 15;
        pageVC.titleColorSelected = kGlobalColor;
        tmpVC = pageVC;
    }
    tmpVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tmpVC animated:YES];
}

#pragma mark - LifeCycle


- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[ToolCell class] forCellReuseIdentifier:@"ToolCellId"];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
         [weakSelf.toolVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
             [weakSelf.tableView reloadData];
             [weakSelf.tableView endHeaderRefresh];
         }];
    }];
    [self.tableView beginHeaderRefresh];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = kGlobalColor;
    self.navigationItem.title = @"兔玩";
        
    UIColor *whiteTitle =  [UIColor whiteColor];
    NSDictionary *dic = [NSDictionary dictionaryWithObject:whiteTitle forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - LazyLoad

- (ToolViewModel *)toolVM {
	if(_toolVM == nil) {
		_toolVM = [[ToolViewModel alloc] init];
	}
	return _toolVM;
}

@end
