//
//  Hero.m
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Hero.h"
#import "Map.h"

@implementation Hero

@synthesize heroName = _heroName;
@synthesize weapon = _weapon;
@synthesize map = _map;
@synthesize delegate = _delegate;


-(id) initWithName:(NSString*)aName
{
    if (self = [super init])
    { 
        _heroName = [[NSString alloc] initWithString:aName];//以后都这么写，与（self.heroName = aName;）同义 
        self.map = [Map instance];
    }
    return self;
}

-(void) dealloc
{
    self.map = nil;
    self.weapon = nil;
    self.heroName = nil;
    [super dealloc];
}

-(void) move
{
    
}

@end
