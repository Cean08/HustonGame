//
//  ElseTableViewController.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ElseTableViewController.h"
#import "ElseCell.h"
#import "WelComeViewController.h"
#import "LoginViewController.h"
#import "WebViewController.h"
#import "OpinionViewController.h"
@interface ElseTableViewController ()

@end

@implementation ElseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ElseCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 3;
    }else{
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ElseCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.loginLB.text = @"点击登录";
        cell.imageView.image = [UIImage imageNamed:@"User"];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.titleLB.text = @"我的收藏";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_star_20x20_"];
        }else{
            cell.titleLB.text = @"清除缓存";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_delete_20x20_"];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            cell.titleLB.text = @"去App Store评个5分吧";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_app_store_20x20_"];
        }else if (indexPath.row == 1){
            cell.titleLB.text = @"转给朋友";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_share_app_20x20_"];
        }else{
            cell.titleLB.text = @"欢迎页";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_welcome_20x20_"];
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            cell.titleLB.text = @"投稿说明";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_compose_20x20_"];
        }else if (indexPath.row == 1){
            cell.titleLB.text = @"意见反馈";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_feedback_20x20_"];
        }else if (indexPath.row == 2){
            cell.titleLB.text = @"关注我们的微博";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_weibo_20x20_"];
        }else{
            cell.titleLB.text = @"关于我们";
            cell.imageView.image = [UIImage imageNamed:@"more_icon_about_us_20x20_"];
        }
    }
    return cell;
}
//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        //跳转到登录界面带导航是组的样式
        LoginViewController *loginVC = [[LoginViewController alloc]initWithStyle:UITableViewStyleGrouped];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:loginVC];
        navi.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            //跳转到App Store
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/tu-wan-you-xi-bao-xue-you/id909571207?mt=8"]];
        }
        if (indexPath.row == 2) {
            //跳到欢迎界面
            WelComeViewController *welVC =[WelComeViewController new];
            [self presentViewController:welVC animated:YES completion:nil];
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            NSString *path = @"http://api.tuwan.com/app/?class=html5&temp=submit";
            NSURL *url = [NSURL URLWithString:path];
            WebViewController *explainVC=[[WebViewController alloc]initWithWebURL:url];
            explainVC.hidesBottomBarWhenPushed = YES;
            explainVC.title = @"投稿说明";
            [self.navigationController pushViewController:explainVC animated:YES];
            
        }
        if (indexPath.row == 1) {
            OpinionViewController *opinionVC = [OpinionViewController new];
            opinionVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:opinionVC animated:YES];
        }
        if (indexPath.row == 2) {
            NSString *path = @"http://www.tuwan.com";
            NSURL *url = [NSURL URLWithString:path];
            WebViewController *explainVC=[[WebViewController alloc]initWithWebURL:url];
            explainVC.hidesBottomBarWhenPushed = YES;
            explainVC.title = @"关注我们的微博";
            [self.navigationController pushViewController:explainVC animated:YES];
        }
        if (indexPath.row == 3) {
            NSString *path = @"http://api.tuwan.com/app/?class=html5&temp=about";
            NSURL *url = [NSURL URLWithString:path];
            WebViewController *explainVC=[[WebViewController alloc]initWithWebURL:url];
            explainVC.hidesBottomBarWhenPushed = YES;
            explainVC.title = @"关于我们";
            [self.navigationController pushViewController:explainVC animated:YES];
        }
    }
    
}
//设置每行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }else{
        return 50;
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
