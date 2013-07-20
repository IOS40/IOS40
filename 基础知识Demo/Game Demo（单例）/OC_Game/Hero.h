//
//  Hero.h
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weapon;//用import 是把类里面的所有东西都拿过来用 用class 只是用weapon的名字
@class Map;

typedef struct _Position
{
    int x;
    int y;
}Positon;

@interface Hero : NSObject
{
    Positon _position;
}

@property (nonatomic, retain) NSString* heroName;

@property (nonatomic, retain) Weapon* weapon;

@property (nonatomic, retain) Map* map;

-(id) initWithName:(NSString*)aName;

-(void) move;

@end
