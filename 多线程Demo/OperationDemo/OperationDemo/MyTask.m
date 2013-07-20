//
//  MyTask.m
//  OperationDemo
//
//  Created by Lucifer on 13-4-8.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "MyTask.h"

@implementation MyTask
@synthesize operationId;
- (void)main
{
    NSLog(@"task %i run ...",operationId);
    [NSThread sleepForTimeInterval:10];
    NSLog(@"task %i is finished.",operationId);
}

@end
