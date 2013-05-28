//
//  Map.h
//  OC_Game
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Map : NSObject

@property (nonatomic, retain) NSString* mapName;

@property (nonatomic, retain) NSArray* heros;

+(id) instance;

@end
