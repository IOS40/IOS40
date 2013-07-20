//
//  NPC.h
//  OC_Game
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//
#import <Foundation/Foundation.h>
//#import "Hero.h"
#import "Buy.h"

@class Hero;
@interface NPC : NSObject<Buy>
@property(nonatomic,retain)Hero *hero;

-(id)init;

@end
