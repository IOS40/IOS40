//
//  APPCommonDef.h
//  UI_APPCommonDef
//
//  Created by Ibokan on 12-10-18.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#ifndef UI_APPCommonDef_h
#define UI_APPCommonDef_h

#import "AppDelegate.h"
#import "QYHelpFunction.h"

//返回AppDelegate指针
#define APP_Delegate    (AppDelegate*)[[UIApplication sharedApplication] delegate]

//返回NSUserDefaults指针
#define APP_UserDefaults [NSUserDefaults standardUserDefaults]

//获取bundle地址
#define APP_Bundle      [NSBundle mainBundle]

//获取系统版本号等信息
#define Device_Version  [[[UIDevice currentDevice] systemVersion] floatValue]
#define Device_Name     [[UIDevice currentDevice] systemName]
#define Device_UID      [[UIDevice currentDevice] uniqueIdentifier]

//获取屏幕信息（尺寸，宽，高）
#define LcdSize [[UIScreen mainScreen] bounds]
#define lcdW LcdSize.size.width
#define lcdH LcdSize.size.height

//释放内存
#define Release(pRet) if(pRet){ [pRet release]; pRet = nil;}

//新浪微博相关
#define kAppKey             @"3802551498"
#define kAppSecret          @"8c08c0c48661cb54a6da098dfa5e2153"
#define kAppRedirectURI     @"http://weibo.com/u/1721237260"
#define kCustomSSO          @"com.tudou.weibo"
#ifndef kAppKey
#error
#endif
#ifndef kAppSecret
#error
#endif
#ifndef kAppRedirectURI
#error
#endif
#ifndef kCustomSSO
#error
#endif



#endif
