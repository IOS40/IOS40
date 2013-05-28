//
//  MyProperty.m
//  归档解档
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "MyProperty.h"

@implementation MyProperty

@synthesize name = _name;
@synthesize address = _address;
@synthesize age = _age;

- (id) initWithName:(NSString *)aName andAddress:(NSString *)aAddress andAge:(int)aAge
{
    if (self = [super init])
    {
        self.name = aName;
        self.address = aAddress;
        self.age = aAge;
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder//编码
{
    [aCoder encodeObject:self.name forKey:@"mingzi"];
    [aCoder encodeObject:self.address forKey:@"dizhi"];
    [aCoder encodeInteger:self.age forKey:@"nianling"];
}
- (id) initWithCoder:(NSCoder *)aDecoder//解码
{
    self = [self initWithName:[aDecoder decodeObjectForKey:@"mingzi"] andAddress:[aDecoder decodeObjectForKey:@"dizhi"] andAge:[aDecoder decodeIntegerForKey:@"nianling"]];
    return self;
}
@end
