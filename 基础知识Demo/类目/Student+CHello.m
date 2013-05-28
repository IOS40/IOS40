//
//  Student+CHello.m
//  OC_Category
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "Student+CHello.h"

@implementation Student (CHello)
-(void) sayHello//类目中扩展的方法
{
    NSLog(@"%@ say Hello",self.studentName);
}
@end
