//
//  AppDelegate.m
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "AppDelegate.h"
#import "Map.h"
#import "Fashi.h"
#import "Zhanshi.h"
#import "Shushi.h"
#import "NPC.h"
#import "Buy.h"
#import "Hero.h"
@implementation AppDelegate
@synthesize window = _window;
- (void)dealloc
{
    [[Map instance] release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NPC *np = [[NPC alloc]init];
    [np buyDaoju];
    [self loadGame];
    [self startGame];
    
   


    
}


-(void) loadGame
{
    Map* map = [Map instance];
    
    Fashi* fs = [[Fashi alloc] initWithName:@"Lucifer"];
    Zhanshi* zs = [[Zhanshi alloc] initWithName:@"LuLu"];
    Shushi* ss = [[Shushi alloc] initWithName:@"HongNing"];
    
    NSArray* array = [NSArray arrayWithObjects:fs, zs, ss, nil];
    map.heros = array;
    
    [fs release];
    [zs release];
    [ss release];
    

    
}
-(void) startGame
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(runGame) userInfo:nil repeats:YES];
    [timer fire];
}

-(void) runGame
{
    for (Hero* h in [[Map instance] heros])
    {
        [h move];
    }
}


@end
