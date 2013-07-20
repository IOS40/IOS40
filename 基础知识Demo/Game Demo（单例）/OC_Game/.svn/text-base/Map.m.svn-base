//
//  Map.m
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Map.h"

@implementation Map

@synthesize mapName = _mapName;
@synthesize heros = _heros;


-(void) dealloc
{
    self.heros = nil;
    self.mapName = nil;
    [super dealloc];
}

+(id) instance
{
    static Map* map = nil;
    if (!map)
    {
        map = [[Map alloc] init];
        map.mapName = @"开天辟地";
    }
    return map;
}

@end
