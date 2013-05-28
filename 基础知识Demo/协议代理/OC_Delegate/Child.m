//
//  Child.m
//  OC_Delegate
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Child.h"
#import "Mother.h"

@implementation Child

@synthesize delegate = _delegate;

-(void)play//玩 方法
{
    NSLog(@"出去玩");
    NSLog(@"玩累了，衣服也脏了，妈妈给洗一下衣服吧");
    [self.delegate washClose];
}

-(void)writeHomeWork//写作业 方法
{
    NSLog(@"写作业");
}

-(void) dealloc
{
    [super dealloc];
}

@end
