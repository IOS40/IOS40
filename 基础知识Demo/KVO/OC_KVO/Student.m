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



-(id) initWithName:(NSString*)aName withAge:(int)aAge
{
    if (self = [super init])
    {
        [self addObserver:self forKeyPath:@"studentName" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];//注册监听对象，监听对象为Student自己，监听着studentName属性 ，返回字典
        
        [self setValue:aName forKey:@"studentName"];//与这两种是一个意思 （1）self.studentName = aName; （2） _studentName = aName;
        
        _studentAge = aAge;
    }
    return self;
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context//实现监听方法，chang是new\old
{
    NSLog(@"%@",change);
    NSLog(@"%@",context);
}



-(void) sayHi
{
    NSLog(@"Hello everybody,My Name is %@,%d years old",self.studentName,_studentAge);
}

-(void) dealloc
{
    [self removeObserver:self forKeyPath:@"studentName"];//移除监听
    [super dealloc];
}

@end
