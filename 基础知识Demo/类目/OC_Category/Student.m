//
//  Student.m
//  OC_KVC
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize studentName = _studentName;

-(id) initWithName:(NSString*)aName Age:(int)aAge
{
    if (self = [super init])
    {
        self.studentName = aName;
        _studentAge = aAge;
    }
    return self;
}

-(void) sayHi
{
    NSLog(@"Hello everybody,My Name is %@,%d years old",self.studentName,_studentAge);
}

-(void) dealloc
{
    [super dealloc];
}

@end
