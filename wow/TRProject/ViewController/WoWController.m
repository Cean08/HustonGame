//
//  WoWController.m
//  TRProject
//
//  Created by Cean on 16/7/29.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "WoWController.h"
#import "ToolViewController.h"
#import "TuWanItem3ViewController.h"
#import "NewsPageViewController.h"
#import "ElseTableViewController.h"

@interface WoWController ()
@property (nonatomic) ToolViewController *toolVC;
@property (nonatomic) TuWanItem3ViewController *circleVC;
@property (nonatomic) NewsPageViewController *newsVC;
@property(nonatomic)ElseTableViewController *elseVC;
@end

@implementation WoWController

- (void)viewDidLoad {
    [super viewDidLoad];
    //修改某个控件的某个属性的默认值
    [UITabBar appearance].translucent = NO;
    [UINavigationBar appearance].translucent = NO;
    //设置导航栏颜色
    [UINavigationBar appearance].barTintColor = kGlobalColor;
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
     self.tabBar.tintColor = kGlobalColor;
    //调整导航栏中的元素颜色为白色
    [UINavigationBar appearance].barStyle = UIBarStyleBlackOpaque;
    
   UINavigationController *navi0 = [[UINavigationController alloc] initWithRootViewController:self.newsVC];
    UINavigationController *navi1 = [[UINavigationController alloc] initWithRootViewController:self.toolVC];
    UINavigationController *navi2 = [[UINavigationController alloc] initWithRootViewController:self.circleVC];
    UINavigationController *navi3 = [[UINavigationController alloc] initWithRootViewController:self.elseVC];

    self.viewControllers = @[navi0, navi1, navi2, navi3];
}


#pragma mark - LazyLoad
- (ToolViewController *)toolVC {
	if(_toolVC == nil) {
		_toolVC = [[ToolViewController alloc] initWithStyle:UITableViewStylePlain];
        _toolVC.tabBarItem.title = @"工具";
        _toolVC.navigationItem.title = @"兔玩";

        _toolVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_tool_25x25_"];
	}
	return _toolVC;
}

- (TuWanItem3ViewController *)circleVC {
	if(_circleVC == nil) {
		_circleVC = [[TuWanItem3ViewController alloc] initWithStyle:UITableViewStylePlain];
        _circleVC.tabBarItem.title = @"圈子";
        _circleVC.navigationItem.title = @"兔玩";
        _circleVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_bbs_25x25_"];
	}
	return _circleVC;
}

- (NewsPageViewController *)newsVC {
	if(_newsVC == nil) {
		_newsVC = [[NewsPageViewController alloc] init];
        _newsVC.titleColorNormal = kLightGreen;
        _newsVC.titleColorSelected = kGlobalColor;
        _newsVC.tabBarItem.title = @"资讯";
        _newsVC.navigationItem.title = @"兔玩";
        _newsVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_news_25x25_"];
	}
	return _newsVC;
}

- (ElseTableViewController *)elseVC {
    if(_elseVC == nil) {
        _elseVC = [[ElseTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        _elseVC.tabBarItem.title = @"其他";
        _elseVC.navigationItem.title = @"兔玩";
        _elseVC.tabBarItem.image = [UIImage imageNamed:@"icon_tab_more_25x25_"];
    }
    return _elseVC;
}



@end
