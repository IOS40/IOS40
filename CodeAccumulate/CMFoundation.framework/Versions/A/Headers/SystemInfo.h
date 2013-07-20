//
//  SystemInfo.h
//  NewWiFiPlus
//
//  Created by 王金宇 on 13-3-19.
//  Copyright (c) 2013年 天脉聚源传媒科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sys/utsname.h>

//系统版本
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

typedef enum
{
    iPhone_1G     = 0,
    iPhone_3G     = 1,
    iPhone_3GS    = 2,
    iPhone_4      = 3,
    iPhone_4S     = 4,
    iPhone_5      = 5,
    iPod_Touch_1G = 10,
    iPod_Touch_2G = 11,
    iPod_Touch_3G = 12,
    iPod_Touch_4G = 13,
    iPod_Touch_5G = 14,
    others        = 100
}DeviceType;

@interface SystemInfo : NSObject
{
    DeviceType deviceType;
}

+ (id)shared;

/*
 *获取当前的设备型号
 */
- (DeviceType)getCurrentDeviceType;

@end
