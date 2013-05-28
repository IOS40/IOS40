//
//  AppDelegate.h
//  SinaWeibo
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class SinaWeibo;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    UIWindow *_window;
    
    SinaWeibo *_sinaWeibo;
    
    ViewController *_viewController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (readonly, nonatomic) SinaWeibo *sinaWeibo;

@end
