//
//  Worker.m
//  通知
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Worker.h"

@implementation Worker

-(id)init
{
    if (self = [super init])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"wansui" object:nil];
    }
    return self;
}

-(void)receiveNotification:(NSNotification *)aNotification
{
    NSDictionary *dict = [aNotification userInfo];
    NSLog(@"工人收到通知%@",[dict valueForKey:@"guowangwansui"]);
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"wansui" object:self];
    [super dealloc];
}

@end
