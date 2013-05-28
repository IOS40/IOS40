//
//  MyClass.m
//  OC_KVC
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "MyClass.h"
#import "Student.h"

@implementation MyClass

@synthesize className = _className;
@synthesize classStudents = _classStudents;

-(id) initWithClassName:(NSString*)aClassName Students:(NSArray*)aStudents
{
    if (self = [super init])
    {
        self.className = aClassName;
        _classStudents = [[NSMutableArray alloc] initWithArray:aStudents];
    }
    return self;
}

-(void) sayHi
{
    for (Student* s in self.classStudents)
    {
        [s sayHi];
    }
}

-(void) dealloc
{
    self.className = nil;
    self.classStudents = nil;
    [super dealloc];
}

@end
