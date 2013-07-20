//
//  Student.m
//  OC_Property1
//
//  Created by Ibokan on 12-10-15.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Student.h"

@implementation Student

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
    if(aAge < 0)
    {
        NSLog(@"人的年龄不能为负值");
        aAge = 0;
    }
    _studentAge = aAge;
}
-(int) studentAge
{
    return _studentAge;
}








-(Student*) initWithName:(NSString*)aName andAge:(int)aAge
{
    if (self = [super init])
    {
        _studentName = aName;
        if (aAge < 0)
        {
            NSLog(@"人名不能为负");
            aAge = 0;
        }
        _studentAge = aAge;
    }
    return self;
}





@end
