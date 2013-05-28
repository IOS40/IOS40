//
//  Worker.h
//  通知
//
//  Created by Ibokan on 12-10-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Worker : NSObject

-(id)init;

-(void)receiveNotification:(NSNotification*)aNotification;

@end
