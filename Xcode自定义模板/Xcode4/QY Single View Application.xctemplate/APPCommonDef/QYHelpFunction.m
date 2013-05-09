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

//自定义状态栏
@implementation StatusBarWindow

@synthesize label = _label;

- (id)init
{
    CGRect statusBar =[[UIApplication sharedApplication] statusBarFrame];
    
    if (self = [super initWithFrame:CGRectMake(0, -statusBar.size.height, LcdSize.size.width, statusBar.size.height)])
    {
        self.windowLevel=UIWindowLevelAlert;
        self.backgroundColor=[UIColor clearColor];
        [self makeKeyAndVisible];
        
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(lcdW - 80, 0, 80, 20)];
        [self.label setBackgroundColor:[UIColor blackColor]];
        [self.label setText:@"发送中..."];
        [self.label setFont:[UIFont fontWithName:@"Helvetica" size:12]];
        [self.label setTextColor:[UIColor whiteColor]];
        [self  addSubview:self.label];
        
    }
    return self;
}

- (void)setLabelText:(NSString*) aString
{
    if (self.label)
    {
        self.label.text = [NSString stringWithString:aString];
    }
}

- (void)show
{
    CGRect statusBar =[[UIApplication sharedApplication] statusBarFrame];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    [self setFrame:CGRectMake(0, 0, LcdSize.size.width, statusBar.size.height)];
    [UIView commitAnimations];
}
- (void)hidden
{
    CGRect statusBar =[[UIApplication sharedApplication] statusBarFrame];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.3];
    [self setFrame:CGRectMake(0, -statusBar.size.height, LcdSize.size.width, statusBar.size.height)];
    [UIView commitAnimations];
}

- (void)dealloc
{
    self.label = nil;
    [super dealloc];
}

@end