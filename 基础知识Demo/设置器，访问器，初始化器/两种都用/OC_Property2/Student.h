//
//  Student.h
//  OC_Property1
//
//  Created by Ibokan on 12-10-15.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString* _studentName;
    int _studentAge;
}


//用@property的形式
@property (nonatomic, retain) NSString* studentHobby;
@property (nonatomic, retain) NSString* studentAddress;



//自定义初始化函数
-(Student*) initWithName:(NSString*)aName andAge:(int)aAge;


-(void) setStudentName:(NSString*)aName;//_studentName 的属性设置器
-(NSString*) studentName;//_studentName 的属性访问器

-(void) setStudentAge:(int)aAge;
-(int) studentAge;

@end
