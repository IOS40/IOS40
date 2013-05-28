//
//  CheckNetwork.m
//  testNet
//
//  Created by b126 on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CheckNetwork.h"
#import "Reachability.h"
@implementation CheckNetwork
+(BOOL)isExistenceNetwork
{
	BOOL isExistenceNetwork;
	Reachability *r = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
			isExistenceNetwork=FALSE;
            
            break;
        case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
                
            
            break;
        case ReachableViaWiFi:
			isExistenceNetwork=TRUE;
                       break;
    }
//	if (!isExistenceNetwork) {
//		UIAlertView *myalert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"网络不存在" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil,nil];
//		[myalert show];
//		[myalert release];
//
//	}
	return isExistenceNetwork;
}
@end
