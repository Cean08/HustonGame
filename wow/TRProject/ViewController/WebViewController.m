//
//  WebViewController.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property(nonatomic) UIWebView *webView;
@end

@implementation WebViewController
- (instancetype)initWithWebURL:(NSURL *)webURL{
    if (self = [super init]) {
        _webURL = webURL;
    }
    return self;
}



- (UIView *)maskView {
    if(_maskView == nil) {
        _maskView = [[UIView alloc] init];
        
        [self.view addSubview:_maskView];
        //        _maskView.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:240 / 255.0 alpha:1.0];
        _maskView.backgroundColor = [UIColor whiteColor];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
            make.height.equalTo(44);
        }];
    }
    return _maskView;
}

- (UITextField *)commentTF {
    if(_commentTF == nil) {
        _commentTF = [[UITextField alloc] init];
        
        _commentTF.borderStyle = UITextBorderStyleBezel;
        _commentTF.placeholder = @"发表评论";
        [self.maskView addSubview:_commentTF];
        _commentTF.textAlignment = NSTextAlignmentLeft;
        [_commentTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.height.equalTo(30);
            make.width.equalTo(150);
        }];
        //        UIImageView *iv = [UIImageView new];
        //        [self.commentTF addSubview:iv];
        //        [iv  mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.top.bottom.equalTo(0);
        //            make.width.equalTo(iv.mas_width).dividedBy(3);
        //        }];
        //        iv.image = [UIImage imageNamed:@"button_comment_174x27_"];
    }
    return _commentTF;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
        _iconIV.clipsToBounds = YES;
        [self.maskView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commentTF.mas_right).equalTo(50);
            make.centerY.equalTo(0);
            make.height.width.equalTo(30);
        }];
        _iconIV.image = [UIImage imageNamed:@"button_collect_normal_32x32_"];
    }
    return _iconIV;
}

- (UIImageView *)sendIV {
    if(_sendIV == nil) {
        _sendIV = [[UIImageView alloc] init];
        _sendIV.contentMode = UIViewContentModeScaleAspectFill;
        _sendIV.clipsToBounds = YES;
        [self.maskView addSubview:_sendIV];
        [_sendIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-50);
            make.centerY.equalTo(0);
            make.height.width.equalTo(30);
        }];
        _sendIV.image = [UIImage imageNamed:@"button_share_32x32_"];
    }
    return _sendIV;
}







- (void)viewDidLoad {
    [super viewDidLoad];
    [self maskView];
    [self commentTF];
    [self iconIV];
    [self sendIV];
    _webView = [UIWebView new];
        
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(0);
        make.bottom.equalTo(-44);
    }];
    [_webView loadRequest:[NSURLRequest requestWithURL:_webURL]];
    _webView.delegate = self;
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = kGlobalColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.view showHUD];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

    [self.view showWarning:error.localizedDescription];
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
