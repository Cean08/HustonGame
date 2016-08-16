//
//  TuWanHeaderView.m
//  TuWanProject
//
//  Created by tarena1004 on 16/7/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TuWanHeaderView.h"

@implementation TuWanHeaderView
- (void)setDuration:(NSTimeInterval)duration{
    _duration = duration;
    self.autoScroll = _autoScroll;//当图片滚动时才滚动

}
- (void)setAutoScroll:(BOOL)autoScroll{
    _autoScroll = autoScroll;
    [_timer invalidate];//让定时器失效
    _timer = nil;//使滚动失效
    
    if (autoScroll) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        }repeats:YES];
    }
}

#pragma mark - ic Delegate
//有几个
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)])//做个判断可防止方法未调用而报错
    {
        return [_dataSource numberOfItems:self];
    }

    return 0;
}
//什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(tuwanHV:iconURLForRow:)]) {
        NSURL *iconURL = [_dataSource tuwanHV:self iconURLForRow:index];
        [((UIImageView *)view) setImageURL:iconURL];
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([_delegate respondsToSelector:@selector(tuwanHV:disSelectedItemAtIndex:)]) {
        [_delegate tuwanHV:self disSelectedItemAtIndex:index];
    }

}
//设置动画模式
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }return value;
}
//设置标题
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageController.currentPage = carousel.currentItemIndex;
    if ([_dataSource respondsToSelector:@selector(tuwanHV:titleForIndex:)]) {
        self.titleLb.text = [_dataSource tuwanHV:self titleForIndex:_ic.currentItemIndex];
    }
}

//
- (void)reloadData{
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(tuwanHV:titleForIndex:)]) {
        self.titleLb.text = [_dataSource tuwanHV:self titleForIndex:_ic.currentItemIndex];
    }
    if ([_dataSource respondsToSelector:@selector(numberOfItems:)]) {
        self.pageController.numberOfPages = [_dataSource numberOfItems:self];
    }
    self.pageController.currentPage = _ic.currentItemIndex;
}
#pragma mark - LifeCycle
- (void)setFrame:(CGRect)frame{
    CGFloat width = frame.size.width;
    CGFloat height = width * 197 / 320 + 30;//图片尺寸 320*197
    super.frame = CGRectMake(0, 0, width, height);
}
//设置滚动视图的尺寸和位置

- (instancetype)initWithFrame:(CGRect)frame{
    CGFloat width = frame.size.width;
    CGFloat height = width * 197 / 320 + 30;
    self = [super initWithFrame:CGRectMake(0, 0, width, height)];
    if (self) {
        [self pageController];
        [self maskView];
        [self ic];
        [self titleLb];
        _duration = 2.0;//先设置时间，再设置自动滚动
        self.autoScroll = YES;
    }
    return self;
}

- (UIPageControl *)pageController{

    if (_pageController == nil) {
        _pageController = [UIPageControl new];
        [self.maskView addSubview:_pageController];
        [_pageController mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-8);
            make.centerY.equalTo(0);
        }];
    }
    return _pageController;
}

- (UIView *)maskView{
    if (_maskView == nil) {
        _maskView = [UIView new];
        _maskView.backgroundColor = kColorRGB(241, 241, 241, 1.0);
        [self addSubview:_maskView];
        [_maskView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(30);
            make.left.bottom.right.equalTo(0);
            make.top.equalTo(self.ic.mas_bottom);
        }];
            }
return _maskView;
}
- (UILabel *)titleLb{
    if (nil == _titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont systemFontOfSize:14];
        [self.maskView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.centerY.equalTo(0);
        }];
            }
return _titleLb;

}
//设置代理，设置图片视图的位置和滚动速度
- (iCarousel *)ic{
    if (_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(0);
        }];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = .2;
    }
    return _ic;

}


@end
