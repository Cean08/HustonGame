//
//  VideoViewController.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "TuWanNetWorking.h"
@interface VideoViewController ()
@property(nonatomic)UIWebView *webView;
@end

@implementation VideoViewController
- (instancetype)initWithAid:(NSString *)aid{
    if (self = [super init]) {
        _aid = aid;
    }
    return self;
}
- (UIWebView *)webView{
    if (_webView == nil) {
        _webView = [[UIWebView alloc] init];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = kGlobalColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.view showHUD];
    self.view.backgroundColor = [UIColor whiteColor];
    [TuWanNetWorking getVideoPic:_aid completionHandler:^(VideoAndPicModel *model, NSError *error) {
        NSURL *videoURL = model.content.firstObject.video.ct_URL;
        _webView = [UIWebView new];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        [_webView loadRequest:[NSURLRequest requestWithURL:videoURL]];
        [self.view hideHUD];
    }];
    
    // Do any additional setup after loading the view.
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
