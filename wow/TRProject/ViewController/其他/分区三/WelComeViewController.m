//
//  WelComeViewController.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WelComeViewController.h"

@interface WelComeViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation WelComeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configScrollView];
}
-(void)configScrollView{
    //创建滚动视图
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置scrollView的代理人为当前控制器
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 7, self.view.frame.size.height);
    
    //循环创建4个 imageView并添加到scrollView中
    for (int i = 0; i < 7; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        //获取当次循环所需要的图片名称
        NSString *imageName = [NSString stringWithFormat:@"welcome%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.frame = CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        //将创建好的imageView添加到scrollView上
        [self.scrollView addSubview:imageView];
        //在创建最后一个imageView时,创建一个button添加到imageView上
        if (i == 6) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake((self.view.bounds.size.width / 2)-([UIScreen mainScreen].bounds.size.width / 3 / 2), self.view.bounds.size.height * 0.86, [UIScreen mainScreen].bounds.size.width / 3, 30);
            btn.layer.cornerRadius = 12;
            btn.layer.masksToBounds = YES;
            [btn addTarget:self action:@selector(goElse:) forControlEvents:UIControlEventTouchUpInside];
            //把把最后一个imageView的交互打开
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:btn];
        }
    }
    //去掉水平方向和垂直方法滑动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    //关闭弹性
    self.scrollView.bounces = NO;
    
    //设置scrollView整夜滑动
    self.scrollView.pagingEnabled = YES;
    //将scrollView添加到self.view上
    [self.view addSubview:self.scrollView];
}
-(void)goElse:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
