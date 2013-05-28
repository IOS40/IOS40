//
//  Child.h
//  OC_Delegate
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WashClose.h"

@class Mother;

@interface Child : NSObject

@property (nonatomic, assign)id<WashClose>  delegate;

-(void)play;
-(void)writeHomeWork;

@end
