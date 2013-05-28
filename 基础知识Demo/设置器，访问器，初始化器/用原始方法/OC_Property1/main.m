//
//  main.m
//  OC_Property1
//
//  Created by Ibokan on 12-10-15.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Student.h"

int main(int argc, char *argv[])
{
    Student* stu = [[Student alloc] init];
    [stu setStudentName:@"小明"];
    [stu setStudentAge:-18];
    NSLog(@"%@,%d",[stu studentName],[stu studentAge]);
    
    
    Student* stu1 = [[Student alloc] initWithName:@"小红" andAge:-20];
    NSLog(@"%@,%d",[stu1 studentName],[stu1 studentAge]);
    
    
    [stu release];
    [stu1 release];
    
    return 0;
}
