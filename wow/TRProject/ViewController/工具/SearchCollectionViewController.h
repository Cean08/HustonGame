//
//  SearchCollectionViewController.h
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToyModel.h"
@interface SearchCollectionViewController : UICollectionViewController
@property(nonatomic)NSArray<ToyModel *> *results;
@end
