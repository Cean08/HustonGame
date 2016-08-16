//
//  DetailTableViewController.m
//  玩具箱
//
//  Created by tarena11 on 16/7/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "DetailTableViewController.h"
#import "NetManager.h"
#import "ToyDetailCell.h"
#import "ToyDetailViewModel.h"

@interface DetailTableViewController ()
@property(nonatomic)ToyDetailViewModel *detailVM;
@end

@implementation DetailTableViewController
-(ToyDetailViewModel *)detailVM{
    if (_detailVM == nil) {
        _detailVM = [[ToyDetailViewModel alloc]init];
    }
    return _detailVM;
}
-(instancetype)initWithID:(NSInteger)ID{
    if (self = [super init]) {
        _ID = ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏tableView的线
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[ToyDetailCell class] forCellReuseIdentifier:@"Cell"];
    
    [NetManager getDetailID:self.ID completionHandler:^(ToyDetailModel *model, NSError *error) {
        [self.detailVM.dataList addObject:model];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.detailVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToyDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //tableView不可以点击
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.iconIV setImageURL:[self.detailVM icon:indexPath.row]];
    cell.titleLB.text = [self.detailVM title:indexPath.row];
    cell.levelLB.text = [self.detailVM level:indexPath.row];
    cell.qualityLB.text = [self.detailVM quality:indexPath.row];
    cell.reqLevelLB.text = [self.detailVM reqLevel:indexPath.row];
    cell.spellLB.text = [self.detailVM spell:indexPath.row];
    cell.descriptionLB.text = [self.detailVM description:indexPath.row];
    if ([self.detailVM hasGetLB:indexPath.row]) {
        cell.label.text = @"  获取方式";
    }else {
        cell.label.backgroundColor = [UIColor clearColor];
    }
    cell.getLB.text = [self.detailVM get:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 310;
}
@end
