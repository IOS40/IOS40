//
//  QYHelpFunction.m
//  UI_TableView2
//
//  Created by Ibokan on 12-11-13.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "QYHelpFunction.h"

@implementation QYHelpFunction

@end

@implementation NSDictionary (MutableDeepCopy)
 
- (NSMutableDictionary*)deepCopy
{
    NSMutableDictionary* result = [[NSMutableDictionary alloc] initWithCapacity:self.count];//初始化
    NSArray* allKeys = [self allKeys];//获取所有的key
    for (NSString* key in allKeys)//通过key遍历数组
    {
        id value = [self valueForKey:key];
        id copy = nil;
        if ([value respondsToSelector:@selector(deepCopy)])
        {
            copy = [value deepCopy];
        }
        else if ([value respondsToSelector:@selector(mutableCopy)])
        {
            copy = [value mutableCopy];
        }
        if (!copy)
        {
            copy = [value copy];
        }
        [result setValue:value forKey:key];
        [copy release];
    }
    return result;
}

@end