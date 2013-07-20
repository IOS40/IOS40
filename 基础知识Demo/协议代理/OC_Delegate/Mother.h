//
//  Mother.h
//  OC_Delegate
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WashClose.h"
@class Child;

@interface Mother : NSObject<WashClose>

@property (nonatomic, retain) Child* child;

-(id)init;
-(void)washClose;
-(void)manageChild;

@end
