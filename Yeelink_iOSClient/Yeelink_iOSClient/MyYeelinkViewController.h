//
//  MyYeelinkViewController.h
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyIndicatorView.h"

@interface MyYeelinkViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate>

@property(strong,nonatomic) UITableView* myYeelinktableView;
@property(strong,nonatomic) UIView* enterView;
@property(strong,nonatomic) UIImageView *logoImageView;
@property(strong,nonatomic) UITextField *accountNumberTextField;
@property(strong,nonatomic) UITextField *passWordTextField;
@property(strong,nonatomic) UIButton *enterButton;
@property(strong,nonatomic) UIButton *loginButton;
@property(strong,nonatomic) NSMutableArray *deviceArray;
@property(strong,nonatomic) MyIndicatorView *indicatorView;
@property(strong,nonatomic) UIBarButtonItem *cancleButton;
@property(strong,nonatomic) UIBarButtonItem *refreshButton;
@property(strong,nonatomic) NSMutableData *finalData;
@end
