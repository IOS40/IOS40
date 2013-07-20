//
//  Singleton.m
//  SingletonProject
//
//  Created by 颂 关 on 12-6-14.
//  Copyright (c) 2012年 博看文思. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+(Singleton*) instance
{
    //静态变量,生命周期是整个程序，在下一次该函数调用时仍可使用 。
    static Singleton *instance = nil; 
    if(!instance)
    {
        instance = [[Singleton alloc] init];
    }
    return instance;
}
@end
