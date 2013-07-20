//
//  RootViewController.h
//  InstancePassValue
//
//  Created by 王金宇 on 12-11-27.
//  Copyright (c) 2012年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (strong, nonatomic)UILabel* showText;

+ (id)instance;
- (void)loadShowTextLebel;
- (void)loadPushToNextViewControllerButton;
@end
