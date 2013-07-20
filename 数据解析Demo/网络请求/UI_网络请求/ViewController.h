//
//  ViewController.h
//  UI_网络请求
//
//  Created by Ibokan on 12-11-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData *_dataArray;
    NSMutableArray *_imageArray;
}
-(void)syncGetRequest;
-(void)syncPostRequest;
-(void)asynGetRequest;
-(void)asynPostRequest;
@end
