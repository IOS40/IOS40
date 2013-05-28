//
//  Student.h
//  OC_KVC
//
//  Created by Ibokan on 12-10-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    int _studentAge;
}

@property (nonatomic, retain) NSString* studentName;

-(id) initWithName:(NSString*)aName Age:(int)aAge;

-(void) sayHi;

@end
