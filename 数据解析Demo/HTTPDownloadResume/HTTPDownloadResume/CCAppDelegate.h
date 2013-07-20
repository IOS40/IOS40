//
//  CCAppDelegate.h
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CCViewController;
@class CCDownViewController;

@interface CCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CCViewController *viewController;
@property (strong, nonatomic) CCDownViewController* downViewController;

@property (strong, nonatomic) UINavigationController* navController;

@end
