//
//  ViewController.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/20.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TuWanViewModel.h"
#import "TuWanMainCell.h"
#import "TuWanPicCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
#import "TuWanHeaderView.h"
#import "WebViewController.h"
#import "VideoViewController.h"
#import "NewsPageViewController.h"
#import "PhotosViewController.h"
@interface ViewController ()<TuWanHeaderViewDelegate,TuWanHeaderViewDataSource>
@property(nonatomic)TuWanViewModel *tuwanVM;
@property(nonatomic) TuWanHeaderView *tuwanHV;
@end

@implementation ViewController
//懒加载，并设置tuwanHV的位置大小，及持续时间
- (TuWanHeaderView *)tuwanHV{
    if (!_tuwanHV) {
        _tuwanHV = [[TuWanHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0)];
        _tuwanHV.delegate = self;
        _tuwanHV.dataSource = self;
        _tuwanHV.duration = 3;
    }

    return _tuwanHV;
}

- (NSInteger)numberOfItems:(TuWanHeaderView *)tuwanHV{

    return self.tuwanVM.adNumber;
}
- (NSURL *)tuwanHV:(TuWanHeaderView *)tuwanHV iconURLForRow:(NSInteger)index{
    return [self.tuwanVM adIconURL:index];

}
- (NSString *)tuwanHV:(TuWanHeaderView *)tuwanHV titleForIndex:(NSInteger)index{
    return [self.tuwanVM title:index];

}

- (void)tuwanHV:(TuWanHeaderView *)tuwanHV disSelectedItemAtIndex:(NSInteger)index{
    switch ([self.tuwanVM adTypeForRow:index]) {
        case DetailTypeHTML:
        {   WebViewController *vc = [[WebViewController alloc] initWithWebURL:[self.tuwanVM adHtmlURLForRow:index]];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case DetailTypePic:
        {   PhotosViewController *vc = [[PhotosViewController alloc] initWithAid:[self.tuwanVM adAidForRow:index]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
        break;
        case DetailTypeVideo:
        {   VideoViewController *vc = [[VideoViewController alloc]initWithAid:[self.tuwanVM adAidForRow:index]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch ([self.tuwanVM typeForRow:indexPath.row]) {
        case DetailTypeHTML:
        {   WebViewController *vc = [[WebViewController alloc] initWithWebURL:[self.tuwanVM htmlURLForRow:indexPath.row]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case DetailTypeVideo:
        {   VideoViewController *vc = [[VideoViewController alloc] initWithAid:[self.tuwanVM aidForRow:indexPath.row]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case DetailTypePic:
        {   PhotosViewController *vc = [[PhotosViewController alloc] initWithAid:[self.tuwanVM aidForRow:indexPath.row]];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }

    
    
}

//这里是设置cell的高度。方法和以前一样，但在设置带三张图片的cell时，由于其高度不定，要自适应，故引入了三方UITableView+FDTemplateLayoutCell。在使用该三方时需要注意修改几处地方（以及使用该方法时，在布局时，必须满足在Y方向能实现必要的约束）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.tuwanVM hasPic:indexPath.row]) {
        return [tableView fd_heightForCellWithIdentifier:@"Pcell" configuration:^(TuWanPicCell *cell) {
            cell.titleLb.text = [self.tuwanVM title:indexPath.row];
            cell.clickLb.text = [self.tuwanVM click:indexPath.row];
            //这里是给cell中有多个图片赋值，先遍历图片数组，根据（行数和图片下标）取得所需的各个图片的URL，
            [cell.iconList enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSURL *iconURL = [self.tuwanVM picList:indexPath.row][idx];
                //给图片地址(用到了YYKit中的方法)，实现从网络加载图片
                [obj setImageURL:iconURL ];
            }];

        }];
        
    }else {
        
        return 88;
    }

}

-(instancetype)initWithMsgType:(TuWanMsgType)msgType {
    if (self = [super init]) {
        _msgType  = msgType;
    }
    return self;
}

- (TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM = [[TuWanViewModel alloc]initWithMsgType:_msgType];//这里记得将_msgType传进来
    }
    return _tuwanVM;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.tuwanVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //由于在tableview中有两种cell，故要先判断是哪一种，再写cell中的内容
    if ([self.tuwanVM hasPic:indexPath.row]) {
        TuWanPicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Pcell" forIndexPath:indexPath];
        cell.titleLb.text = [self.tuwanVM title:indexPath.row];
        cell.clickLb.text = [self.tuwanVM click:indexPath.row];
        //这里是给cell中有多个图片赋值，先遍历图片数组，根据（行数和图片下标）取得所需的各个图片的URL，
        [cell.iconList enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURL *iconURL = [self.tuwanVM picList:indexPath.row][idx];
            //给图片地址(用到了YYKit中的方法)，实现从网络加载图片
            [obj setImageURL:iconURL ];
        }];
        return cell;
    }else {
        TuWanMainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Mcell" forIndexPath:indexPath];
        cell.titleLb.text = [self.tuwanVM title:indexPath.row];
        cell.detailLb.text = [self.tuwanVM detail:indexPath.row];
        cell.clickLb.text = [self.tuwanVM click:indexPath.row];
        [cell.iconIV setImageWithURL:[self.tuwanVM pic:indexPath.row] placeholder:nil];
        return cell;
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   [CTFactory addSearchItemForVC:self clickedHandler:^{
       NSLog(@"按钮被点击了");
   }];
    self.title = @"兔玩";
  
    [self.tableView registerClass:[TuWanMainCell class] forCellReuseIdentifier:@"Mcell"];
    [self.tableView registerClass:[TuWanPicCell class] forCellReuseIdentifier:@"Pcell"];

    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
//        [weakSelf.tuwanVM getRequestModel:RequestModelRefresh completionHandler:^(NSError *error){
       [ weakSelf.tuwanVM getDataWithMode:RequestModeRefresh  completionHandler:^(NSError *error) {
 
            if([weakSelf.tuwanVM hasAD])
        {
        
            weakSelf.tableView.tableHeaderView = weakSelf.tuwanHV;
            [weakSelf.tuwanHV reloadData];
        
        }else {
            weakSelf.tableView.tableHeaderView = nil;
        
        }
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
        
    }];
   
    [self.tableView addFooterRefresh:^{
        [ weakSelf.tuwanVM getDataWithMode:RequestModeMore  completionHandler:^(NSError *error) {
//        [weakSelf.tuwanVM getRequestModel:RequestModelMore completionHandler:^(NSError *error) {
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
     [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
