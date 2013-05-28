//
//  main.m
//  SingletonProject
//
//  Created by 颂 关 on 12-6-14.
//  Copyright (c) 2012年 博看文思. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
int main (int argc, const char * argv[])
{

    @autoreleasepool
    {
        //s 和 s2 是同一个对象
        Singleton * s = [Singleton instance];
        
        Singleton * s2 = [Singleton instance];
        
        NSLog(@"%p, %p",s,s2);//输出的地址一样
    }
    return 0;
}

