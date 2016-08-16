//
//  PageViewController.m
//  TRProject
//
//  Created by Cean on 16/7/28.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ToolPageViewController.h"
#import "FlashBackViewModel.h"
#import "FlashBackViewController.h"
#import "HeroFlashBackViewController.h"


@interface ToolPageViewController ()
//在导航栏上的分段控件
@property (nonatomic) UISegmentedControl *segmentedC;
//保存segment和pageController的当前index
@property (nonatomic) NSInteger currentIndex;

@property (nonatomic) FlashBackViewController *flashBackVC;
@end

@implementation ToolPageViewController

#pragma mark - WMPageViewController method

- (NSArray<NSString *> *)titles {
    return @[@"英雄联赛", @"快速比赛"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    
    pageController.menuHeight = 30;
    
    if (self.segmentedC.selectedSegmentIndex == 0) {
        self.flashBackVC = [[FlashBackViewController alloc] initWithFbType:index];
    }
    if (self.segmentedC.selectedSegmentIndex == 1) {
        self.flashBackVC = [[FlashBackViewController alloc] initWithFbType:index + 2];
    }
    if (self.segmentedC.selectedSegmentIndex == 2) {
       HeroFlashBackViewController *heroFBVC = [[HeroFlashBackViewController alloc] initWithFbType:index];
        return heroFBVC;
    }
    if (self.segmentedC.selectedSegmentIndex == 3) {
        pageController.menuHeight = 0;
        NSLog(@"需登录才能进入");
        return [UIViewController new];
    }
    return self.flashBackVC;
}


#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
#pragma 配置导航栏 跳转关系:pageVC是在导航栏下的，所有导航栏配置在该类中写，不能再自控制器下写
    self.navigationItem.titleView = self.segmentedC;
    self.menuItemWidth = 100;
    
    self.navigationController.navigationBar.tintColor = kGlobalColor;
    //去掉导航栏返回键自带的标题
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - segmentC method

//SegmentedControl的点中事件
- (void)segmentedChangeController:(UISegmentedControl *)segment {
    //WMPageController 的刷新数据方法，救命的方法
    [self reloadData];
}

- (UISegmentedControl *)segmentedC {
    if(_segmentedC == nil) {
        //分段标题
        _segmentedC = [[UISegmentedControl alloc] initWithItems:@[@"MMR", @"战斗力", @"英雄", @"关注"]];
        _segmentedC.tintColor = kGlobalColor;
        _segmentedC.height = 30;
        //默认第一个
        _segmentedC.selectedSegmentIndex = 0;
        //添加事件
        [_segmentedC addTarget:self action:@selector(segmentedChangeController:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedC;
}

#pragma mark - LazyLoad

- (FlashBackViewController *)flashBackVC {
	if(_flashBackVC == nil) {
		_flashBackVC = [[FlashBackViewController alloc] init];
	}
	return _flashBackVC;
}

@end
