//
//  AllReplyViewController.m
//  CrowProject_Model
//
//  Created by tarena11 on 16/7/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AllReplyViewController.h"
#import "AllReplyViewModel.h"
#import "ReplyCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "PostImageViewController.h"
#import "LoginViewController.h"

@interface AllReplyViewController ()

@property (nonatomic) AllReplyViewModel *replyListVM;

@end

@implementation AllReplyViewController

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithUserID:(NSString *)userID andCell:(Item3Cell *)cell{
    if (self = [super init]) {
        _userID   = userID;
        _userCell = cell;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barTintColor = kGlobalColor;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //隐藏TabbleViewController的线
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[Item3Cell class] forCellReuseIdentifier:@"UserCell"];
    [self.tableView registerClass:[ReplyCell class] forCellReuseIdentifier:@"Cell"];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.replyListVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        
        [weakSelf.replyListVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.replyListVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        Item3Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
        
        cell.separatorInset                  = UIEdgeInsetsZero;
        cell.layoutMargins                   = UIEdgeInsetsZero;
        cell.preservesSuperviewLayoutMargins = NO;
        
        cell.headerIV.image    = _userCell.headerIV.image;
        cell.userNameLB.text   = _userCell.userNameLB.text;
        cell.messageLB.text    = _userCell.messageLB.text;
        cell.postImageIV.image = _userCell.postImageIV.image;
        cell.timeLB.text       = _userCell.timeLB.text;
        
        UITapGestureRecognizer *imageClick = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            
            PostImageViewController *vc = [[PostImageViewController alloc] initWithImageURL:_userCell.postImageIV.imageURL];
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
        
        
        
        [cell.allReplyButton removeFromSuperview];
        
        return cell;
    }
    else {
        
        ReplyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        [cell.userIV setImageURL:[self.replyListVM userImageForRow:indexPath.row - 1]];
        cell.userNameLB.text = [self.replyListVM  sentUserNameForRow:indexPath.row - 1];
        
        if ([self.replyListVM isHaveSentToUserForRow:(indexPath.row - 1)]) {
            [cell.sentToUserButton setTitle:[self.replyListVM sentToUserNamenForRow:indexPath.row - 1] forState:UIControlStateNormal];
        }
        [cell.zanButton bk_addEventHandler:^(id sender) {
            cell.zanButton.selected = !cell.zanButton.selected;
        } forControlEvents:UIControlEventTouchUpInside];
        cell.replyMessageLB.text = [self.replyListVM messageForRow:indexPath.row - 1];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"UserCell" configuration:^(Item3Cell *cell) {

            cell.separatorInset                  = UIEdgeInsetsZero;
            cell.layoutMargins                   = UIEdgeInsetsZero;
            cell.preservesSuperviewLayoutMargins = NO;

            cell.headerIV.image    = _userCell.headerIV.image;
            cell.userNameLB.text   = _userCell.userNameLB.text;
            cell.messageLB.text    = _userCell.messageLB.text;
            cell.postImageIV.image = _userCell.postImageIV.image;
            cell.timeLB.text       = _userCell.timeLB.text;

            [cell.allReplyButton removeFromSuperview];
        }];
    }
    else {
        return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(ReplyCell *cell) {

            [cell.userIV setImageURL:[self.replyListVM userImageForRow:indexPath.row - 1]];
            cell.userNameLB.text = [self.replyListVM  sentUserNameForRow:indexPath.row - 1];

            if ([self.replyListVM isHaveSentToUserForRow:(indexPath.row - 1)]) {
                [cell.sentToUserButton setTitle:[self.replyListVM sentToUserNamenForRow:indexPath.row - 1] forState:UIControlStateNormal];
            }

            cell.replyMessageLB.text = [self.replyListVM messageForRow:indexPath.row - 1];
        }];
    }
}

#pragma mark - LazyLoad (懒加载)

- (AllReplyViewModel *)replyListVM {
	if(_replyListVM == nil) {
		_replyListVM = [[AllReplyViewModel alloc] initWithUserID:_userID];
	}
	return _replyListVM;
}

- (UITableViewCell *)userCell {
    if(_userCell == nil) {
        _userCell = [[Item3Cell alloc] init];
    }
    return _userCell;
}

@end
