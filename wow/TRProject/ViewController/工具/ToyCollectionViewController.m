//
//  ToyCollectionViewController.m
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ToyCollectionViewController.h"
#import "ToyViewModel.h"
#import "ToyCell.h"
#import "NetManager.h"
#import "SearchCollectionViewController.h"
#import "DetailTableViewController.h"
@interface ToyCollectionViewController ()<UISearchResultsUpdating,UISearchControllerDelegate>
@property(nonatomic)ToyViewModel *toyVM;
@property(nonatomic)NSMutableArray *mutArray;
//搜索控制器
@property(nonatomic)UISearchController *searchC;
@end

@implementation ToyCollectionViewController
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout index:(NSInteger)index{
    if (self = [super initWithCollectionViewLayout:layout]) {
        _index = index;
    }
    return self;
}
//懒加载
-(ToyViewModel *)toyVM{
    if (_toyVM == nil) {
        _toyVM = [ToyViewModel new];
    }
    return _toyVM;
}
-(UISearchController *)searchC{
    if (_searchC == nil) {
        //设置第二个界面的layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        SearchCollectionViewController *vc =[[SearchCollectionViewController alloc]initWithCollectionViewLayout:layout];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat width = (long)(self.view.frame.size.width - 6 * 10) / 5;
        CGFloat height = width + 32;
        layout.itemSize = CGSizeMake(width, height);
        vc.collectionView.collectionViewLayout = layout;
        _searchC = [[UISearchController alloc]initWithSearchResultsController:vc];
        //搜索栏发生变化时的代理
        _searchC.searchResultsUpdater = self;
        _searchC.delegate = self;
        _searchC.hidesNavigationBarDuringPresentation = NO;
    }
    return _searchC;
}
//搜索栏代理
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *text = searchController.searchBar.text;
    NSMutableArray<ToyModel *> *tmpArr = [NSMutableArray new];
    //遍历
    [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //判断搜索栏里面的内容是否包含Name对应的内容
        if ([obj.Name containsString:text]) {
            //有就添加到临时数组中
            [tmpArr addObject:obj];
        }
    }];
    //获取当前搜索控制器的 搜索结果控制器的指针
    SearchCollectionViewController *searchVC=(SearchCollectionViewController *)searchController.searchResultsController;
    //tmpArr给searchVC的results属性赋值
    searchVC.results=tmpArr;
}
//生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //searchBar就是搜索栏UI
    [self.collectionView addSubview:self.searchC.searchBar];
    //设置是否可以在本控制器中切换别的控制器
    self.definesPresentationContext = YES;
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ToyCell class] forCellWithReuseIdentifier:@"Cell"];
    
    [NetManager getToyCompletionHandler:^(NSArray<ToyModel *> *model, NSError *error) {
        
        self.toyVM.dataList = model;
        
        [self toyWithType];
        [self.collectionView reloadData];
    }];
}

//TableView代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.toyVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ToyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageURL:[self.toyVM iconURLForRow:indexPath.row]];
    cell.titleLabel.text = [self.toyVM titleLabelForRow:indexPath.row];

    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewController *vc = [[DetailTableViewController alloc]initWithID:[self.toyVM detail:indexPath.row]];

    [self.navigationController pushViewController:vc animated:YES];
}
//归类
-(void)toyWithType{
    switch (_index) {
        case 0:
            break;
        case 1:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (![obj.Type isEqualToString:@"德拉诺之王"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 2:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"世界事件"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 3:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"任务"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 4:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"掉落"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 5:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"卡牌"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 6:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"专业"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 7:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"成就"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        case 8:
        {
            NSMutableArray *tmpArray = [NSMutableArray array];
            [self.toyVM.dataList enumerateObjectsUsingBlock:^(ToyModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if ([obj.Type isEqualToString:@"其他"]) {
                    [tmpArray addObject:obj];
                }
            }];
            self.toyVM.dataList = tmpArray;
        }
            break;
        default:
            break;
    }
}
@end
