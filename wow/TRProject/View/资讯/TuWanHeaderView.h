//
//  TuWanHeaderView.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@class TuWanHeaderView;//声明一个TuWanHeaderView类，不然系统无法在下面的代码中识别
@protocol TuWanHeaderViewDataSource <NSObject>
@required
//模仿tableview的几个必要方法，将要实现的方法列出
- (NSInteger)numberOfItems:(TuWanHeaderView *)tuwanHV;
- (NSString *)tuwanHV:(TuWanHeaderView *)tuwanHV titleForIndex:(NSInteger)index;
- (NSURL *)tuwanHV:(TuWanHeaderView *)tuwanHV iconURLForRow:(NSInteger)index;
@end

@protocol TuWanHeaderViewDelegate <NSObject>//设置代理
@optional
-(void)tuwanHV:(TuWanHeaderView *)tuwanHV disSelectedItemAtIndex:(NSInteger)index;
@end

@interface TuWanHeaderView : UIView<iCarouselDelegate,iCarouselDataSource>
- (void)reloadData;
@property(nonatomic,weak) id<TuWanHeaderViewDelegate> delegate;
@property(nonatomic,weak) id<TuWanHeaderViewDataSource> dataSource;
@property (nonatomic) iCarousel      *ic;
@property (nonatomic) UILabel        *titleLb;
@property (nonatomic) UIView         *maskView;
@property (nonatomic) UIPageControl  *pageController;
@property (nonatomic) NSTimer        *timer;
@property (nonatomic) BOOL           autoScroll;
@property (nonatomic) NSTimeInterval duration;

@end
