//
//  AppDelegate.m
//  OC_Delegate
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "AppDelegate.h"
#import "Mother.h"

@implementation AppDelegate
@synthesize window = _window;


- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    Mother* mother = [[Mother alloc] init];
    [mother washClose];
    [mother manageChild];
    [mother release];
}

@end
