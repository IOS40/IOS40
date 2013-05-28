//
//  AppDelegate.m
//  PopViewWithSlider
//
//  Created by 东子 Adam on 12-5-8.
//  Copyright (c) 2012年 热频科技. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    mSlider = [[UISlider alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    mSlider.minimumValue = 0;
	mSlider.maximumValue = 1000;
	mSlider.value = 0;
	[mSlider addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    
    popView = [[UILabel alloc]initWithFrame:CGRectMake(mSlider.frame.origin.x, mSlider.frame.origin.y-20, 70, 20)];
    [popView setTextAlignment:UITextAlignmentCenter];
    [popView setBackgroundColor:[UIColor clearColor]];
    [popView setAlpha:0.f];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window addSubview:mSlider];
    [self.window addSubview:popView];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)updateValue:(id)slider{
    UIImageView *imageView = [mSlider.subviews objectAtIndex:2];
    
    CGRect theRect = [self.window convertRect:imageView.frame fromView:imageView.superview];

    [popView setFrame:CGRectMake(theRect.origin.x-22, theRect.origin.y-30, popView.frame.size.width, popView.frame.size.height)];
    
    NSInteger v = mSlider.value+0.5;
    [popView setText:[NSString stringWithFormat:@"%d",v]];
    
    [UIView animateWithDuration:0.5  
                     animations:^{  
                         [popView setAlpha:1.f];
                     }  
                     completion:^(BOOL finished){  
                         // 动画结束时的处理  
                     }];
    
    [timer invalidate];
    timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 
                                             target:self 
                                           selector:@selector(disPopView) 
                                           userInfo:nil repeats:NO];
}

- (void)disPopView{
    [UIView animateWithDuration:0.5  
                     animations:^{  
                         [popView setAlpha:0.f];
                     }  
                     completion:^(BOOL finished){  
                         // 动画结束时的处理  
                     }];
    
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
