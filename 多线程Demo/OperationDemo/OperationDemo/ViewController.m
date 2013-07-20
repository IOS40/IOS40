//
//  ViewController.m
//  OperationDemo
//
//  Created by Lucifer on 13-4-8.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "ViewController.h"
#import "MyTask.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    
    //设置线程池中的线程数，也就是并发操作数。
    //默认情况下是-1，也就是没有限制，同时运行队列中的全部操作。
    
    [queue setMaxConcurrentOperationCount:2];
    
    int index = 1;
    MyTask *task = [[[MyTask alloc] init] autorelease];
    task.operationId = index++;
    [queue addOperation:task];
    
    
    task = [[[MyTask alloc] init] autorelease];
    task.operationId = index++;

//    if ([[queue operations] count]>0)
//    {
//         //操作直接有依赖关系，比如第二个操作必须等第一个操作结束后再执行
//        MyTask *theBeforeTask = [[queue operations] lastObject];
//        [task addDependency:theBeforeTask];
//    }
    
    [queue addOperation:task];
    
    
    //test线程3
    task = [[[MyTask alloc] init] autorelease];
    task.operationId = index++;
    [queue addOperation:task];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
