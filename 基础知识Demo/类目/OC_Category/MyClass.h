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
@property (nonatomic, retain) NSMutableArray* classStudents;


-(id) initWithClassName:(NSString*)aClassName Students:(NSArray*)aStudents;

-(void) sayHi;

@end
