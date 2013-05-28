//
//  Weapon.h
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weapon : NSObject

@property (nonatomic, retain) NSString* weaponName;

-(id) initWithName:(NSString*)aName;

@end
