//
//  AppDelegate.m
//  Project_MusicPlayer
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    NSString* url = [NSString stringWithFormat:@"http://ttlrccnc.qianqian.com/dll/lyricsvr.dll?sh?Artist=%@&Title=%@&Flags=0",SetToHexString(@"羽泉"),SetToHexString(@"最美")];
    
    NSLog(@"%@",url);
    //这个url可以获取所以关于这首歌的finalID  找到fanaliD 像下面的  130474L 就可以获取歌词的最终的下载地址
    
    NSString *finalCode = ttpCode(@"羽泉", @"最美", 130474L);
    
    NSString* finalUrl = [NSString stringWithFormat:@"http://ttlrccnc.qianqian.com/dll/lyricsvr.dll?dl?Id=%lu&Code=%@",130474L,finalCode];
    
    NSLog(@"%@",finalUrl);
    //生成的这个url就可以发送请求取得歌词了
    
    
    return YES;
}


NSString *ttpCode(NSString *artist, NSString *title, long lrcId)
{
    
	const char *bytes=[[artist stringByAppendingString:title] cStringUsingEncoding:NSUTF8StringEncoding];
	long len= strlen(bytes);
	int *song = (int*)malloc(sizeof(int)*len);
	for (int i = 0; i < len; i++)
		song[i] = bytes[i] & 0xff;
	
	long intVal1 = 0, intVal2 = 0, intVal3 = 0;
	intVal1 = (lrcId & 0x0000FF00) >> 8;
	if ((lrcId & 0xFF0000) == 0) {
		intVal3 = 0xFF & ~intVal1;
	} else {
		intVal3 = 0xFF & ((lrcId & 0x00FF0000) >> 16);
	}
	intVal3 = intVal3 | ((0xFF & lrcId) << 8);
	intVal3 = intVal3 << 8;
	intVal3 = intVal3 | (0xFF & intVal1);
	intVal3 = intVal3 << 8;
	if ((lrcId & 0xFF000000) == 0) {
		intVal3 = intVal3 | (0xFF & (~lrcId));
	} else {
		intVal3 = intVal3 | (0xFF & (lrcId >> 24));
	}
	long uBound = len - 1;
	while (uBound >= 0) {
		int c = song[uBound];
		if (c >= 0x80)
			c = c - 0x100;
		intVal1 = (c + intVal2) & 0x00000000FFFFFFFF;
		intVal2 = (intVal2 << (uBound % 2 + 4)) & 0x00000000FFFFFFFF;
		intVal2 = (intVal1 + intVal2) & 0x00000000FFFFFFFF;
		uBound -= 1;
	}
	uBound = 0;
	intVal1 = 0;
	while (uBound <= len - 1) {
		long c = song[uBound];
		if (c >= 128)
			c = c - 256;
		long intVal4 = (c + intVal1) & 0x00000000FFFFFFFF;
		intVal1 = (intVal1 << (uBound % 2 + 3)) & 0x00000000FFFFFFFF;
		intVal1 = (intVal1 + intVal4) & 0x00000000FFFFFFFF;
		uBound += 1;
	}
	long intVal5 = Conv(intVal2 ^ intVal3);
	intVal5 = Conv(intVal5 + (intVal1 | lrcId));
	intVal5 = Conv(intVal5 * (intVal1 | intVal3));
	intVal5 = Conv(intVal5 * (intVal2 ^ lrcId));
    
    long intVal6 = intVal5;
    if (intVal6 > 0x80000000) intVal5 = intVal6 - 0x100000000;
    
	return [[NSString stringWithFormat:@"%ld",intVal5] autorelease];
}

long Conv(long i)
{
    long r = i % 0x100000000;
    if (i >= 0 && r > 0x80000000)
        r = r - 0x100000000;
    
    if (i < 0 && r < 0x80000000)
        r = r + 0x100000000;
    return r;
}

NSMutableString* SetToHexString(NSString *str)
{
    
    const char *s = [str cStringUsingEncoding:NSUnicodeStringEncoding];
    NSMutableString *result = [NSMutableString string];
    
	if(!s) return NULL;
    int j = 0;
	int n= (int)[str lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];
    for(int i=0; i<n; i++)
    {
		unsigned ord=(unsigned)s[i];
        if (j+2>1022)
        {
            return NULL;
        }
        
        [result appendFormat:@"%c%c",SingleDecToHex((ord-ord%16)/16),SingleDecToHex(ord%16)];
        
	}
    return result;
}

char SingleDecToHex(int dec)
{
	dec = dec % 16;
	if(dec < 10)
    {
		return (char)(dec+'0');
	}
	char arr[6]={'A','B','C','D','E','F'};
	return arr[dec-10];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
