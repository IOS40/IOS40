//
//  Sensors.h
//  Yeelink
//
//  Created by Wang Jun on 13-3-12.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SensorInformation : NSObject
@property(strong,nonatomic) NSString* sensorId;
@property(strong,nonatomic) NSNumber* sensorType;
@property(strong,nonatomic) NSString* sensorAbout;
@property(strong,nonatomic) NSString* sensorLastData;
@property(strong,nonatomic) NSString* sensorTitle;
@end
