//
//  LocationInformation.h
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-23.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationInformation : NSObject
@property (strong,nonatomic) NSString* timeStamp;
@property (strong,nonatomic) NSString* latitude;
@property (strong,nonatomic) NSString* longitude;
@property (strong,nonatomic) NSString* moveSpeed;

@end
