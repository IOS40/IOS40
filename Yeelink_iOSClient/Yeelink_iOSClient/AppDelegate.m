//
//  AppDelegate.m
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window=_window;
@synthesize homePageViewController=_homePageViewController;
@synthesize myYeelinkViewController=_myYeelinkViewController;
@synthesize settingViewController=_settingViewController;


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"隐藏" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"出现" object:nil];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    _homePageViewController=[[HomePageViewController alloc]init];
    UINavigationController *HPNC=[[UINavigationController alloc]initWithRootViewController:_homePageViewController];
    [HPNC.navigationBar setBarStyle:UIBarStyleBlack];
    
    _myYeelinkViewController=[[MyYeelinkViewController alloc]init];
    UINavigationController *MYNC=[[UINavigationController alloc]initWithRootViewController:_myYeelinkViewController];
    [MYNC.navigationBar setBarStyle:UIBarStyleBlack];
    
    _settingViewController=[[SettingViewController alloc]init];
    UINavigationController *SNC=[[UINavigationController alloc]initWithRootViewController:_settingViewController];
    [SNC.navigationBar setBarStyle:UIBarStyleBlack];
    
    NSArray* NCArray=[[NSArray alloc]initWithObjects:MYNC,HPNC,SNC,nil];
    _tableBarController=[[UITabBarController alloc]init];
    [_tableBarController setViewControllers:NCArray];
    [_tableBarController setSelectedIndex:1];
    [_tableBarController.tabBar setTintColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]];
    self.window.rootViewController=_tableBarController;
    
    
    
    [self.window makeKeyAndVisible];
    
    _userButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_userButton setFrame:CGRectMake(LCDW/2-160, LCDH-49,160, 49)];
    [_userButton addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [_userButton setTag:0];
    [_userButton setImage:[UIImage imageNamed:@"myYeelink.png"] forState:UIControlStateNormal];
    [self.window addSubview:_userButton];
    
    _setButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_setButton setFrame:CGRectMake(LCDW/2, LCDH-49,160, 49)];
    [_setButton addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [_setButton setTag:2];
    [_setButton setImage:[UIImage imageNamed:@"tool.png"] forState:UIControlStateNormal];
    [self.window addSubview:_setButton];
    
    _searchButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_searchButton setFrame:CGRectMake(LCDW/2-32, LCDH-64,64, 64)];
    [_searchButton addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventTouchUpInside];
    [_searchButton setTag:1];
    [_searchButton setImage:[UIImage imageNamed:@"search_2.png"] forState:UIControlStateNormal];
    [self.window addSubview:_searchButton];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonAppear) name:@"出现" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonDisAppear) name:@"隐藏" object:nil];
    
    return YES;
}
-(void)buttonAppear
{
    [_setButton setHidden:NO];
    [_searchButton setHidden:NO];
    [_userButton setHidden:NO];
}
-(void)buttonDisAppear
{
    [_setButton setHidden:YES];
    [_searchButton setHidden:YES];
    [_userButton setHidden:YES];
}
-(void)selectView:(UIButton*)sender
{
    if(sender.tag==0)
    {
        [_userButton setImage:[UIImage imageNamed:@"myYeelink_2.png"] forState:UIControlStateNormal];
        [_setButton setImage:[UIImage imageNamed:@"tool.png"] forState:UIControlStateNormal];
        [_searchButton setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    }
    else if(sender.tag==1)
    {
        [_userButton setImage:[UIImage imageNamed:@"myYeelink.png"] forState:UIControlStateNormal];
        [_setButton setImage:[UIImage imageNamed:@"tool.png"] forState:UIControlStateNormal];
        [_searchButton setImage:[UIImage imageNamed:@"search_2.png"] forState:UIControlStateNormal];
    }
    else
    {
        [_userButton setImage:[UIImage imageNamed:@"myYeelink.png"] forState:UIControlStateNormal];
        [_setButton setImage:[UIImage imageNamed:@"tool_2.png"] forState:UIControlStateNormal];
        [_searchButton setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
    }
    [_tableBarController setSelectedIndex:sender.tag];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
