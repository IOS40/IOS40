//
//  Shushi.m
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Shushi.h"
#import "Weapon.h"
#import "Map.h"

@implementation Shushi

-(id) initWithName:(NSString *)aName
{
    if (self = [super initWithName:aName])
    {
        Weapon* wuqi = [[Weapon alloc] initWithName:@"无极棍"];
        super.weapon = wuqi;
        [wuqi release];
    }
    return self;
}

-(void) move
{
    _position.x += 3;
    _position.y += 2;
    NSLog(@"术士%@,在地图%@上行走,正拿着武器%@,移动到了坐标%d,%d",[super heroName],super.map.mapName,super.weapon.weaponName,_position.x,_position.y);
}

@end
