//
//  PageViewController.m
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "PageViewController.h"
#import "ToyCollectionViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController
-(NSArray<NSString *> *)titles{
    return @[@"全部",@"德拉诺之王",@"世界事件",@"任务",@"掉落",@"卡牌",@"专业",@"成就",@"其他"];
}
-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}
-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(55, 10, 10, 10);
    CGFloat width = (long)(self.view.frame.size.width - 6 * 10) / 5;
    CGFloat height = width+32;
    layout.itemSize = CGSizeMake(width, height);
    ToyCollectionViewController *toyVC = [[ToyCollectionViewController alloc]initWithCollectionViewLayout:layout index:index];
    
    return toyVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    self.navigationItem.title = @"玩具箱";
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = kGlobalColor;
    UIColor *whiteTitle = kGlobalColor;
    NSDictionary *dic = [NSDictionary dictionaryWithObject:whiteTitle forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dic;
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
