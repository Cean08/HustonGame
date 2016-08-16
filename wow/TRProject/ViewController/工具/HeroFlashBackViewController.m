//
//  HeroFlashBackViewController.m
//  TRProject
//
//  Created by Cean on 16/8/5.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "HeroFlashBackViewController.h"
#import "FlashBackHeroCell.h"
#import "FBHeroViewModel.h"

@interface HeroFlashBackViewController ()
@property (nonatomic) FBHeroViewModel *fbHeroVM;
@end

@implementation HeroFlashBackViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.rowHeight = 80;
    //xib注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"FlashBackHeroCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"FlashBackHeroCell"];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [weakSelf.fbHeroVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addFooterRefresh:^{
        [weakSelf.fbHeroVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fbHeroVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlashBackHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlashBackHeroCell" forIndexPath:indexPath];
    [cell.iconIV setImageURL:[self.fbHeroVM iconURL:indexPath.row]];
    cell.nickNameLb.text = [self.fbHeroVM heroName:indexPath.row];
    cell.winRateLb.text = [self.fbHeroVM tianti_pro:indexPath.row];
    cell.useCountLb.text = [self.fbHeroVM useCount:indexPath.row];
    cell.numberOneLb.text = [self.fbHeroVM numberOne:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点中第%ld行", indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - LazyLoad

- (FBHeroViewModel *)fbHeroVM {
	if(_fbHeroVM == nil) {
		_fbHeroVM = [[FBHeroViewModel alloc] initWithFbType:self.fbType];
	}
	return _fbHeroVM;
}

- (instancetype)initWithFbType:(NSInteger)fbType {
    if (self = [super init]) {
        _fbType = fbType;
    }
    return self;
}

- (instancetype)init {
    NSAssert1(NO, @"%s: 必须使用initWithFbType:方法初始化", __FUNCTION__);
    return nil;
}
@end
