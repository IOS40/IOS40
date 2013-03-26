//
//  MyDefine.h
//  zhxf
//
//  Created by Ibokan on 12-11-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef MyDefine_h
#define MyDefine_h
#import "AppDelegate.h"  //本程序特有前缀，此行不通用，若其他工程引用注意修改,需在PREFIX.PCH文件内包含头文件



//返回AppDelegate指针
#define APP_Delegate    (AppDelegate*)[[UIApplication sharedApplication] delegate]
//获取bundle地址
#define APP_Bundle      [NSBundle mainBundle]
#define CONTENT_FILE(aImageName,aImageType) [[NSBundle mainBundle] pathForResource:aImageName ofType:aImageType]

//获取屏幕信息（尺寸，宽，高）
#define LCDSIZE [[UIScreen mainScreen] bounds]
#define LCDW LCDSIZE.size.width
#define LCDH LCDSIZE.size.height

//256色 转uicolor
#define MY_COLOR_RGB(aRed,aGreen,aBlue,aAlpah) [UIColor colorWithRed:aRed/255.0 green:aGreen/255.0 blue:aBlue/255.0 alpha:aAlpah]

//释放内存
#define Release(pRet) if(pRet){ [pRet release]; pRet = nil;}

//以上为通用宏，以下为本程序TuDouTSiX专用宏 
#define MY_DARK_BLACK   MY_COLOR_RGB(33, 33, 33, 1)
#define MY_LIGHT_BLACK  MY_COLOR_RGB(55, 55, 55, 1)


#endif
