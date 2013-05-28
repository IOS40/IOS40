//
//  King.m
//  通知
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "King.h"

@implementation King

-(void)makeNotification
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"国王万岁",@"guowangwansui", nil];
    _notification = [NSNotification notificationWithName:@"wansui" object:self userInfo:dict];
}

-(void)sendNotification
{
    [[NSNotificationCenter defaultCenter] postNotification:_notification];
}

@end
