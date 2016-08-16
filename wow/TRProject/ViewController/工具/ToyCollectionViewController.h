//
//  ToyCollectionViewController.h
//  玩具箱
//
//  Created by tarena11 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToyCollectionViewController : UICollectionViewController
-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout index:(NSInteger)index;
@property(nonatomic, readonly)NSInteger index;
@end
