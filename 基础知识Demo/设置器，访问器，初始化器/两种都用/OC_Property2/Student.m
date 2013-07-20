//
//  Student.m
//  OC_Property1
//
//  Created by Ibokan on 12-10-15.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Student.h"

@implementation Student


//用@synthesize的形式
@synthesize studentHobby = _studentHobby;
@synthesize studentAddress = _studentAddress;


-(Student*) initWithName:(NSString*)aName andAge:(int)aAge
{
    if (self = [super init])
    {
        _studentName = aName;
        _studentAge = aAge;
    }
    return self;
}



-(void) setStudentName:(NSString*)aName
{
    _studentName = aName;
}
-(NSString*) studentName
{
    return _studentName;
}



-(void) setStudentAge:(int)aAge
{
    _studentAge = aAge;
}
-(int) studentAge
{
    return _studentAge;
}


@end
