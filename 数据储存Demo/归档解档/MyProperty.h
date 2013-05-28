//
//  MyProperty.h
//  归档解档
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyProperty : NSObject<NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *address;
@property (nonatomic) int age;

- (id) initWithName:(NSString*)aName andAddress:(NSString*)aAddress andAge:(int)aAge;

@end
