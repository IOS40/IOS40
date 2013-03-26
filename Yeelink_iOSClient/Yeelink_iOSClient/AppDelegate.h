//
//  AppDelegate.h
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-18.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"
#import "MyYeelinkViewController.h"
#import "SettingViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITabBarController *_tableBarController;
    UIButton* _userButton;
    UIButton* _searchButton;
    UIButton* _setButton;
}
@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) HomePageViewController *homePageViewController;
@property(strong,nonatomic) MyYeelinkViewController *myYeelinkViewController;
@property(strong,nonatomic) SettingViewController *settingViewController;
@end