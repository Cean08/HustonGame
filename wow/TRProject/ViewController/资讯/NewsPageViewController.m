//
//  NewsPageViewController.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NewsPageViewController.h"
#import "ViewController.h"
#import "SearchViewController.h"
@interface NewsPageViewController ()

@end

@implementation NewsPageViewController


- (NSArray<NSString *> *)titles{
    return @[@"头条", @"独家", @"暗黑3", @"魔兽", @"风暴", @"炉石", @"星际2", @"守望", @"图片", @"视频", @"攻略", @"幻化", @"趣闻", @"COS", @"美女",@"推荐" ];
}

//有多少主题
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
    
}
//每个主题的内容
- (__kindof UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
//    pageController.menuViewBottomSpace = 100;
    pageController.viewFrame = CGRectMake(0, 200, kScreenW, kScreenH - 200);
    pageController.titleColorSelected = [UIColor redColor];
    pageController.titleSizeSelected = 20;
    return [[ViewController alloc] initWithMsgType:index];//根据数组的下标相应的来赋值
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [CTFactory addSearchItemForVC:self clickedHandler:^{
        SearchViewController *vc = [SearchViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
   
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
