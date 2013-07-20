//
//  AppDelegate.m
//  网上资料
//
//  Created by Ibokan on 12-10-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    
    NSLog(@"数组");
    
    NSLog(@"====================1====================");
    
    //指定多个字符串创建数组
    NSArray* array=[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",nil];
    
    
    //数组的长度
    NSLog(@"数组长度%ld",array.count);
    
    NSLog(@"====================2====================");
    
    //通过索引取得对象
    for(int i=0;i<array.count;i++)
    {
        NSString *secondStr=[array objectAtIndex:i];
        NSLog(secondStr,nil);
    }
    
    NSLog(@"====================3====================");
    
    //高速枚举法取得对象,Objective-C2.0开始支持，
    for(NSString *str in array)
    {
        NSLog(str,nil);
    }
    
    NSLog(@"====================4====================");
    
    //对象的追加于删除----------------------
    
    //创建空数组
    NSMutableArray *mutArray=[NSMutableArray arrayWithCapacity:10];
    
    
    //追加对象
    [mutArray addObject:@"A"];
    [mutArray addObjectsFromArray:array];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================5====================");
    
    //插入对象
    NSString *thstr=@"插入值";
    [mutArray insertObject:thstr atIndex:4];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================6====================");
    
    //替换对象
    [mutArray replaceObjectAtIndex:2 withObject:@"替换"];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================7====================");

    //删除所有对象
//    [mutArray removeAllObjects];
//    for(NSString *str1 in mutArray)
//    {
//        NSLog(str1,nil);
//    }
    NSLog(@"====================8====================");

    //删除最后的对象
    [mutArray removeLastObject];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================9====================");

    //删除索引为Index的对象
    [mutArray removeObjectAtIndex:0];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================10====================");

    //删除所有于object同值的对象
    [mutArray removeObject:@"0"];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================11====================");

    //删除数组中所有与object等价的对象
    [mutArray removeObjectIdenticalTo:thstr];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }
    NSLog(@"====================12====================");

    //删除数组中所有与数组array包含相同的元素
    [mutArray removeObjectsInArray:array];
    for(NSString *str1 in mutArray)
    {
        NSLog(str1,nil);
    }

}

@end
