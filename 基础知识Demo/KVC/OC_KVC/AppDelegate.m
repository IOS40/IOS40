//
//  AppDelegate.m
//  OC_KVC
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
    
    Student* stu1 = [[Student alloc] initWithName:@"Tom" Age:18];
    Student* stu2 = [[Student alloc] initWithName:@"Jason" Age:16];
    Student* stu3 = [[Student alloc] initWithName:@"Jack" Age:17];
    Student* stu4 = [[Student alloc] initWithName:@"Lucy" Age:15];
    Student* stu5 = [[Student alloc] initWithName:@"Lily" Age:18];
    Student* stu6 = [[Student alloc] initWithName:@"Mary" Age:18];
    
    NSArray* arrayStudents = [[NSArray alloc] initWithObjects:stu1, stu2, stu3, stu4, stu5, stu6, nil];
    
    MyClass* class1 = [[MyClass alloc] initWithClassName:@"IOS40"withClassStudents:arrayStudents];
   
    
    NSLog(@"%@",[class1 valueForKeyPath:@"classStudents.@avg.studentAge"]);//输出数组中学生年龄的平均值(@sum 是年龄的总和) 用数组中某个对象的一个属性去做运算就用 valueForKeyPaty：
    
    
    //给_classStudents数组赋值
//    [class1 setValue:arrayStudents forKey:@"_classStudents"];//给Myclass属性 数组_classStudents赋值 （赋的值为arrayStudents）
    
    //都是给studentName赋值
//    [class1.student setValue:@"jom" forKey:@"studentName"];
//    [class1 setValue:@"jom" forKeyPath:@"student.studentName"];//与上句是同一个意思 给student的studentName属性赋值，两种写法而已
//    class1.student.studentName = @"jdom";//student类是myclass类的一个属性，类调用属性中的属性并赋值 （在myclass类中要给student创建一块内存，否则传值无效，显示为null）
    
    NSLog(@"=====%@",class1.student.studentName);//输出class1.student.studentName值，看是否赋进去了

    
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
