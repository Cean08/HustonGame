//
//  WebViewController.h
//  TuWanProject
//
//  Created by tarena1004 on 16/7/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController
@property(nonatomic,readonly)NSURL *webURL;
- (instancetype) initWithWebURL:(NSURL *)webURL;
@property (nonatomic) UIView *maskView;
@property (nonatomic) UITextField *commentTF;
@property (nonatomic) UIImageView *iconIV;
@property (nonatomic) UIImageView *sendIV;

@end
