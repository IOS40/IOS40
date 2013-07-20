//
//  AppDelegate.m
//  OC_KVO
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "AppDelegate.h"
#import "MyClass.h"
#import "Student.h"

@implementation AppDelegate
@synthesize window = _window;
- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application

    Student* stu1 = [[Student alloc] initWithName:@"Tom" withAge:18];
    Student* stu2 = [[Student alloc] initWithName:@"Jason" withAge:16];
    Student* stu3 = [[Student alloc] initWithName:@"Jack" withAge:17];
    Student* stu4 = [[Student alloc] initWithName:@"Lucy" withAge:15];
    Student* stu5 = [[Student alloc] initWithName:@"Lily" withAge:18];
    Student* stu6 = [[Student alloc] initWithName:@"Mary" withAge:18];
    
    NSArray* arrayStudents = [[NSArray alloc] initWithObjects:stu1, stu2, stu3, stu4, stu5, stu6, nil];
    
    MyClass* class1 = [[MyClass alloc] initWithClassName:@"IOS_40" Students:arrayStudents];
    
    [class1 sayHi];
    
    [stu1 release];
    [stu2 release];
    [stu3 release];
    [stu4 release];
    [stu5 release];
    [stu6 release];
    [arrayStudents release];
    [class1 release];
}

@end
