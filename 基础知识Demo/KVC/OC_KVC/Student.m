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
        //正常形式的
//        self.studentName = aName;
//        _studentAge = aAge;
        
        
        //用了KVC形式的
        [self setValue:aName forKey:@"studentName"];//设置方式
        [self setValue:[NSNumber numberWithInt:aAge] forKey:@"_studentAge"];//这里setValue后面自动生成的是(id)型 int型的要转化为 字符串型的 所以 用了[NSNumber numberWithInt：aAge]
        
        NSLog(@"=======================");
        NSLog(@"name = %@,age = %d",[self valueForKey:@"_studentName"],[[self valueForKey:@"_studentAge"] intValue]);//访问方式。这里%d处应该写%@（因为是字符串形式的），但是，在最后加了个 intValue，把字符串型转为整型，所以前面应该写%d输出整型
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
