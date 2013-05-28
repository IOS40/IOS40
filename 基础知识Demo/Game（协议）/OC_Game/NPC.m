//
//  NPC.m
//  OC_Game
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "NPC.h"
#import "Buy.h"
#import "Hero.h"
@implementation NPC


@synthesize hero = _hero;

-(void)buyDaoju
{
    NSLog(@"美旅，来件银铃胸甲不");
}

-(id)init
{
    if (self = [super init])
    {
               _hero = [[Hero alloc]init];
        self.hero.delegate = self;
    }
    return self;
}

@end
