//
//  AppDelegate.m
//  通知
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "King.h"
#import "Famer.h"
#import "Worker.h"
@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    King *K = [[King alloc]init];
    
    Famer *F = [[Famer alloc]init];
    Worker *W = [[Worker alloc]init];
    
    [K makeNotification];
    [K sendNotification];
    
    [K release];
    [F release];
    [W release];
}

@end
