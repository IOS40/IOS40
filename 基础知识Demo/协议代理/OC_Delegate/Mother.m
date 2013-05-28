//
//  Mother.m
//  OC_Delegate
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Mother.h"
#import "Child.h"

@implementation Mother

@synthesize child = _child;

-(id)init
{
    if (self = [super init])
    {
        _child = [[Child alloc] init];//孩子生出来了
        self.child.delegate = self;//告诉孩子，我是你妈
    }
    return self;
}

-(void)manageChild//管理孩子 方法
{
    [self.child writeHomeWork];
    [self.child play];
}

-(void)washClose//洗衣服 方法
{
    NSLog(@"妈妈正在洗衣服");
}

-(void) dealloc
{
    self.child = nil;
    [super dealloc];
}

@end
