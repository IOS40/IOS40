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
@synthesize classStudents = _classStudents;//可变数组，班级中的学生
@synthesize student = _student;

-(id) initWithClassName:(NSString*)aClassName withClassStudents:(NSArray*)aClassStudents
{
    if (self = [super init])
    {
        self.className = aClassName;
        _classStudents = [[NSMutableArray alloc] initWithArray:aClassStudents];//把可变数组赋参数。等同于[self setValue:aStudents forKey:@"_classStudents"];
        _student = [[Student alloc] init];//（以后都这么写）等同于self.student = aStudent；
    }
    return self;
}

-(void) sayHi
{
    for (Student* s in self.classStudents)//遍历可变数组classStudent
    {
        [s sayHi];//调用Student类中的sayHi方法
    }
}

-(void) dealloc
{
    self.className = nil;
    self.classStudents = nil;
    [super dealloc];
}

@end
