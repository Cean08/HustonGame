//
//  LoginViewController.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginCell.h"
#import "RegistViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LoginCell class] forCellReuseIdentifier:@"Cell"];
    self.navigationItem.title = @"登录";
    
    //设置登录title的字体颜色及大小
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:22],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:46 / 255.0 green:179 / 255.0 blue:116 / 255.0 alpha:1.0];
    //左右2侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancle:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(regist:)];
}
//取消
-(void)cancle:(UIButton *)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
//注册
-(void)regist:(UIButton *)regist{
    RegistViewController *registVC=[[RegistViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:registVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
////代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.label.text = @"用户名";
            cell.textField.placeholder = @"请输入用户名";
        }else{
            cell.label.text = @"密码";
            cell.textField.placeholder = @"请输入密码";
        }
    }
    if (indexPath.section == 1) {
        [cell.Btn setTitle:@"立即登录" forState:UIControlStateNormal];
        [cell.Btn addTarget:self action:@selector(Loginbtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (indexPath.section == 2) {
        [cell.Btn setTitle:@"使用QQ登录" forState:UIControlStateNormal];
        [cell.Btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//点击事件
-(void)Loginbtn:(UIButton *)sender{
    NSLog(@"立即登录");
}
-(void)btn:(UIButton *)sender{
    NSLog(@"使用QQ登录");
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
