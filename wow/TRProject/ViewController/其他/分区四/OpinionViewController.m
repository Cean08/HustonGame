//
//  OpinionViewController.m
//  GroupC_TuWan
//
//  Created by tarena on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "OpinionViewController.h"

@interface OpinionViewController ()<UITextViewDelegate>

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UILabel *label;
@property (nonatomic) UITextField *titleFD;
@property (nonatomic) UITextView *textView;
@property (nonatomic) UIButton *btn;
@property (nonatomic) UILabel *textLb;

@end

@implementation OpinionViewController

- (UIImageView *)imageView {
    if(_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"xinxi"];
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(8);
            make.size.equalTo(CGSizeMake(35, 30));
        }];
    }
    return _imageView;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines = 0;
        _label.font = [UIFont systemFontOfSize:14];
        _label.text = @"您好，我是兔玩网站的负责人，欢迎您给我们提产品的使用感受和建议!";
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageView.mas_right).equalTo(5);
            make.top.equalTo(self.imageView);
            make.right.equalTo(-10);
            make.height.equalTo(35);
        }];
    }
    return _label;
}

- (UITextField *)titleFD {
    if(_titleFD == nil) {
        _titleFD = [[UITextField alloc] init];
        _titleFD.font = [UIFont systemFontOfSize:14];
        _titleFD.placeholder = @"标题";
        _titleFD.layer.borderColor = [UIColor grayColor].CGColor;
        _titleFD.layer.borderWidth = 1;
        [self.view addSubview:_titleFD];
        [_titleFD mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.label.mas_bottom).equalTo(10);
            make.right.equalTo(-10);
            make.height.equalTo(30);
        }];
    }
    return _titleFD;
}

- (UITextView *)textView {
    if(_textView == nil) {
        _textView = [[UITextView alloc] init];
        _textView.font = [UIFont systemFontOfSize:14];
        _textView.delegate = self;
        _textView.layer.borderColor = [UIColor grayColor].CGColor;
        _textView.layer.borderWidth = 1;
        [self.view addSubview:_textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.titleFD.mas_bottom).equalTo(10);
            make.right.equalTo(-10);
            make.height.equalTo(110);
        }];
    }
    return _textView;
}
- (UILabel *)textLb {
    if(_textLb == nil) {
        _textLb = [[UILabel alloc] init];
        _textLb.numberOfLines = 0;
        _textLb.text = @"感谢您给我们提出建议。抱歉我们不能逐一回复您的意见，但我们会认真阅读，您的支持是对我们最大的帮助和鼓励。";
        _textLb.textColor = [UIColor colorWithRed:217/255.0 green:216/255.0 blue:220/255.0 alpha:1.0];
        _textLb.font = [UIFont systemFontOfSize:14];
        _textLb.numberOfLines = 0;
        _textLb.enabled = NO;//lable必须设置为不可用
        _textLb.backgroundColor = [UIColor clearColor];
        _textLb.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize = CGSizeMake(self.view.frame.size.width-20, 120);//labelsize的最大值
        //关键语句
        CGSize expectSize = [_textLb sizeThatFits:maximumLabelSize];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        _textLb.frame = CGRectMake(0, 7, expectSize.width, expectSize.height);
        [_textView addSubview:_textLb];

    }
    return _textLb;
}

//UITextViewDelegate 的代理方法.当内容发生变化时自动调用
-(void)textViewDidChange:(UITextView *)textView
{
    _textView.text =  textView.text;

    if (_textView.text.length == 0) {
        _textLb.text = @"感谢您给我们提出建议。抱歉我们不能逐一回复您的意见，但我们会认真阅读，您的支持是对我们最大的帮助和鼓励。";
    }else{
        _textLb.text = @"";
        
    }

}


- (UIButton *)btn {
    if(_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"提交" forState:UIControlStateNormal];
        [_btn setTintColor:[UIColor whiteColor]];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn.backgroundColor = kGlobalColor;
        [self.view addSubview:_btn];
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textView.mas_bottom).equalTo(8);
            make.height.equalTo(30);
            make.centerX.equalTo(0);
            make.width.equalTo(200);
        }];
        [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
// button的点击事件
-(void)btnClick:(UIButton *)btn{
    if (self.titleFD.text.length <= 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"http://api.tuwan.com" message:@"还没写标题" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"http://api.tuwan.com" message:@"提交成功，谢谢参与" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = kGlobalColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"意见反馈";
    [self imageView];
    [self label];
    [self titleFD];
    [self textView];
    [self textLb];
    [self btn];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)keyboardFrameChanged:(NSNotification *)noti{
    UIViewAnimationOptions option = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    [UIView animateWithDuration:duration delay:0 options:option animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //视图控制器的view被触摸时触发的
    [self.view endEditing:YES];
}

-(void)dealloc{
    //通知中心注意: 必须在添加监听之后, 对应的生命周期方法里删除监听.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
