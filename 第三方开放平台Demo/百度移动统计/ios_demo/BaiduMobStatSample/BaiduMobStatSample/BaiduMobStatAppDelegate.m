//
//  BaiduMobStatAppDelegate.m
//  BaiduMobStatSample
//
//  Created by jaygao on 11-11-1.
//  Copyright (c) 2011年 Baidu. All rights reserved.
//

#import "BaiduMobStatAppDelegate.h"
#import "BaiduMobStat.h"
#import "MyPageLogViewController.h"

@implementation BaiduMobStatAppDelegate

@synthesize window = _window;
@synthesize tabbarController;

- (void)dealloc
{
    [_window release];
    [tabbarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    statTracker.enableExceptionLog = NO;
    statTracker.channelId = @"Cydia";
    //statTracker.enableExceptionLog = NO;
    statTracker.sessionResumeInterval = 60;
    [statTracker startWithAppId:@"ReplaceMeWithAppId"];
    

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    tabbarController = [[UITabBarController alloc] init];
    
    MyPageLogViewController* v1 = [[[MyPageLogViewController alloc] init] autorelease];
    v1.tabBarItem.title = @"Tab1";

    MyPageLogViewController* v2 = [[[MyPageLogViewController alloc] init] autorelease];
    v2.tabBarItem.title = @"Tab2";

    MyPageLogViewController* v3 = [[[MyPageLogViewController alloc] init] autorelease];
    v3.tabBarItem.title = @"Tab3";
    
    MyPageLogViewController* v4 = [[[MyPageLogViewController alloc] init] autorelease];
    v4.tabBarItem.title = @"Tab4";

    
    NSArray* items =[[NSArray arrayWithObjects:v1, v2, v3, v4, nil] retain];
    tabbarController.viewControllers = items;
    tabbarController.delegate = self;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:tabbarController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    int index = tabBarController.selectedIndex;
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    [statTracker logEvent:@"TabClick3" eventLabel:[NSString stringWithFormat: @"Tab%d", index]];
}    

@end
