//
//  FlashBackViewController.m
//  TRProject
//
//  Created by Cean on 16/7/26.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "FlashBackViewController.h"
#import "FlashBackCell.h"


@interface FlashBackViewController ()
@property (nonatomic)FlashBackViewModel *flashBackVM;
@end

@implementation FlashBackViewController

#pragma init初始化
- (instancetype)initWithFbType:(FlashBackType)fbType {
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _fbType = fbType;
    }
    return self;
}
- (instancetype)init {
    NSAssert1(NO, @"%s: 必须使用initWithFbType:方法初始化", __FUNCTION__);
    return nil;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 80;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    //xib注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"FlashBackCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FlashBackCellId"];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.flashBackVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.flashBackVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlashBackCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlashBackCellId" forIndexPath:indexPath];
    //取出行，简化代码
    NSInteger row = indexPath.row;
    [cell.iconIV sd_setImageWithURL:[self.flashBackVM iconURL:row]];
    //名次是固定的，从1、2、3~~, 且前三个背景色是红色，其余背景是灰色
    cell.rankLb.text = [NSString stringWithFormat:@"%ld", row + 1];
    if (row < 3) {
        cell.rankLb.backgroundColor = [UIColor redColor];
    }else {
        cell.rankLb.backgroundColor = [UIColor lightGrayColor];
    }
    cell.nameLb.text = [self.flashBackVM nikeName:row];
    cell.mmrLb.text = [self.flashBackVM tianti_mmr:row];
    cell.fightingLb.text = [self.flashBackVM tianti_fight:row];
    cell.winRateLb.text = [self.flashBackVM tianti_pro:row];
    cell.videoCountLb.text = [self.flashBackVM tianti_total:row];
    cell.honourLb.text = [self.flashBackVM ranktier:row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点中第%ld行", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - LazyLoad

- (FlashBackViewModel *)flashBackVM {
	if(_flashBackVM == nil) {
		_flashBackVM = [[FlashBackViewModel alloc] initWithFbType:self.fbType];
	}
	return _flashBackVM;
}

@end
