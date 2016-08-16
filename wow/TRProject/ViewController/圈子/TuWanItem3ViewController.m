//
//  ViewController.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/15.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "TuWanItem3ViewController.h"
#import "CircleViewModel.h"
#import "Item3Cell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "AllReplyViewController.h"
#import "LoginViewController.h"
#import "PostImageViewController.h"

@interface TuWanItem3ViewController ()

@property (nonatomic) CircleViewModel *tuWanListVM;

@end

@implementation TuWanItem3ViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[Item3Cell class] forCellReuseIdentifier:@"Cell"];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.tuWanListVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            weakSelf.tableView.tableHeaderView = [weakSelf headerView];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        
        [weakSelf.tuWanListVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}

- (UIView *)headerView {
    
    CGFloat mainWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, (mainWidth * 400 / 640) + 40)];
    
    UIImageView *imageIV  = [[UIImageView alloc] init];
    imageIV.image       = [UIImage imageNamed:@"bbs_banner_new_320x200_"];
    imageIV.contentMode = UIViewContentModeScaleAspectFill;
    [headView addSubview:imageIV];
    [imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(0);
        make.bottom.equalTo(-40);
    }];
    
    UILabel *userName = [[UILabel alloc] init];
    userName.text         = @"兔玩游客";
    userName.textColor    = [UIColor whiteColor];
    userName.shadowColor  = [UIColor darkGrayColor];
    userName.shadowOffset = CGSizeMake(1, 1);
    [headView addSubview:userName];
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageIV.mas_bottom);
        make.left.greaterThanOrEqualTo(10);
    }];
    
    UIImageView *userHead = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    userHead.image              = [UIImage imageNamed:@"defaultavatar_60x60_"];
    userHead.contentMode        = UIViewContentModeScaleAspectFill;
    userHead.layer.shadowColor  = [UIColor darkGrayColor].CGColor;
    userHead.layer.cornerRadius = 30;
    userHead.clipsToBounds      = YES;
    userHead.layer.borderColor  = kGlobalColor.CGColor;
    userHead.layer.borderWidth  = 2;
    [headView addSubview:userHead];
    [userHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(userName);
        make.left.equalTo(userName.mas_right).equalTo(10);
        make.right.equalTo(-10);
    }];
    
    UILabel *detailLB = [[UILabel alloc] init];
    detailLB.textAlignment = NSTextAlignmentCenter;
    detailLB.textColor     = kGlobalColor;
    detailLB.font          = [UIFont systemFontOfSize:16];
    detailLB.text          = [NSString stringWithFormat:@"参与人数%ld,帖子%ld个", self.tuWanListVM.threadsNumber, self.tuWanListVM.postsNumber];
    [headView addSubview:detailLB];
    [detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageIV.mas_bottom).equalTo(16);
        make.centerX.equalTo(headView);
    }];
    
    return headView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tuWanListVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Item3Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.headerIV setImageURL:[self.tuWanListVM headerImageForRow:indexPath.row]];
    cell.userNameLB.text = [self.tuWanListVM userNameForRow:indexPath.row];
    cell.timeLB.text     = [self.tuWanListVM timeForRow:indexPath.row];
    [cell.postImageIV setImageURL:[self.tuWanListVM postImageForRow:indexPath.row]];
    cell.messageLB.text  = [self.tuWanListVM messageForRow:indexPath.row];
    cell.replyLB.text    = [self.tuWanListVM replyForRow:indexPath.row];
    
    UITapGestureRecognizer *imageClick = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        
        PostImageViewController *vc = [[PostImageViewController alloc] initWithImageURL:[self.tuWanListVM postImageForRow:indexPath.row]];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [cell.postImageIV addGestureRecognizer:imageClick];
    
    [cell.zanButton bk_addEventHandler:^(id sender) {
        
        LoginViewController *loginVC = [[LoginViewController alloc]initWithStyle:UITableViewStyleGrouped];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:loginVC];
        navi.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
        
        NSLog(@"跳转登陆");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [cell.replyButton bk_addEventHandler:^(id sender) {
        
        LoginViewController *loginVC = [[LoginViewController alloc]initWithStyle:UITableViewStyleGrouped];
        UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:loginVC];
        navi.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
        
        NSLog(@"跳转登陆");
    } forControlEvents:UIControlEventTouchUpInside];
    
    [cell.moreButton bk_addEventHandler:^(id sender) {
        
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"举报用户" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"提交服务器举报信息");
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [ac addAction:action1];
        [ac addAction:action2];
        
        [self presentViewController:ac animated:YES completion:nil];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    [cell setBlock:^(Item3Cell *cell) {
        NSString *userID = [self.tuWanListVM userIDForRow:indexPath.row];
        
        AllReplyViewController *vc = [[AllReplyViewController alloc] initWithUserID:userID andCell:cell];
        //隐藏tabBar
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(Item3Cell *cell) {
        
        [cell.headerIV setImageURL:[self.tuWanListVM headerImageForRow:indexPath.row]];
        cell.userNameLB.text = [self.tuWanListVM userNameForRow:indexPath.row];
        cell.timeLB.text     = [self.tuWanListVM timeForRow:indexPath.row];
        [cell.postImageIV setImageURL:[self.tuWanListVM postImageForRow:indexPath.row]];
        cell.messageLB.text  = [self.tuWanListVM messageForRow:indexPath.row];
        cell.replyLB.text    = [self.tuWanListVM replyForRow:indexPath.row];
        
    }];
}

#pragma mark - LazyLoad

- (CircleViewModel *)tuWanListVM {
	if(_tuWanListVM == nil) {
		_tuWanListVM = [[CircleViewModel alloc] init];
	}
	return _tuWanListVM;
}

@end
