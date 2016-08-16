//
//  WowsgViewController.m
//  TRProject
//
//  Created by Cean on 16/7/21.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "WowsgViewController.h"
#import "WowsgCell.h"
#import "WowsgViewModel.h"
#import "WebViewController.h"



#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

@interface WowsgViewController ()
@property (nonatomic) WowsgViewModel *wowsgVM;
@end

@implementation WowsgViewController

#pragma mark - LazyLoad

- (WowsgViewModel *)wowsgVM {
    if(_wowsgVM == nil) {
        _wowsgVM = [[WowsgViewModel alloc] init];
    }
    return _wowsgVM;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 60;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    //导航栏配置
    [self configNavigation];
    //注册cell
    [self.tableView registerClass:[WowsgCell class] forCellReuseIdentifier:@"WowsgCellId"];
    //获取数据并刷新显示
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.wowsgVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

- (void)configNavigation {
    //标题
    self.navigationItem.title = @"时光微章监控局";
    //标题颜色字号
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: kGlobalColor, NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
    //导航栏tintColor
    self.navigationController.navigationBar.tintColor = kGlobalColor;
    //去掉导航栏返回键自带的标题
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    __weak typeof(self) weakSelf = self;
    //导航栏左边分享按钮
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"more_icon_share_app_20x20_"] style:UIBarButtonItemStyleDone target:self action:@selector(share:)];
    //导航栏左边刷新按钮
    UIBarButtonItem *refreshItem = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"item_refresh_20x20_"] style:UIBarButtonItemStyleDone handler:^(UIBarButtonItem *sender) {
        //刷新数据
        [self.tableView addHeaderRefresh:^{
            [weakSelf.wowsgVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                [weakSelf.tableView reloadData];
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
#pragma 需要下方代码才上面才能刷新数据
        [self.tableView beginHeaderRefresh];
    }];
    //修复刷新控件的位置，位置往左移
    UIBarButtonItem *fixdeItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixdeItem.width = -20;
    
    self.navigationItem.rightBarButtonItems = @[shareItem, fixdeItem, refreshItem];
}
#pragma 分享的事件,待补充
- (void)share:(UIBarButtonItem *)sender {
    NSLog(@"分享成功");
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"aoh_button_horde_136x100_"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"价格"
                                         images:imageArray
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"大区价格"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
}

#pragma mark - Tableview data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wowsgVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WowsgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WowsgCellId" forIndexPath:indexPath];
    self.tableView.tableHeaderView = cell.headerView;

    cell.serverNameLb.text = [self.wowsgVM serverName:indexPath.row];
    cell.nowPriceLb.text = [self.wowsgVM nowPrice:indexPath.row];
    cell.roseLb.text = [self.wowsgVM rose:indexPath.row];
    if (cell.roseLb.text.integerValue > 0) {
        cell.roseLb.backgroundColor = kColorRGB(200, 21, 21, 1.0);
    }else {
        cell.roseLb.backgroundColor = kGlobalColor;
    }
    return cell;
}

#pragma mark - tableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    WebViewController *webVC = [[WebViewController alloc] initWithWebURL:[self.wowsgVM detailURL:indexPath.row]];
    [self.navigationController pushViewController:webVC animated:YES];
}




@end
