//
//  MyClass.h
//  OC_KVC
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Student;

@interface MyClass : NSObject

@property (nonatomic, retain) NSString* className;
@property (nonatomic, retain) NSMutableArray* classStudents;//定义一个可变数组，班级中的学生

@property (nonatomic, retain) Student* student;

-(id) initWithClassName:(NSString*)aClassName withClassStudents:(NSArray*)aClassStudents;

-(void) sayHi;

@end
