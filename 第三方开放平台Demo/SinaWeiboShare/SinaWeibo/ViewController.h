//
//  ViewController.h
//  SinaWeibo
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SinaWeb/SinaWeibo/SinaWeibo.h"

#import "SinaWeb/SinaWeibo/SinaWeiboRequest.h"

@interface ViewController : UIViewController<SinaWeiboDelegate,SinaWeiboRequestDelegate>
{
    UIButton *_shareButton;
    
    UITextView *_textView;
    
    UIView *_shareView;
    
    UIActivityIndicatorView *_indicator;
}

@property (strong, nonatomic) UIButton *shareButton;

@property (strong, nonatomic) UITextView *textView;

@property (strong, nonatomic) UIView *shareView;

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

- (void) addButton;

- (void) addShareView;

- (void) share:(UIButton*) sender;

- (void) removeShare:(UIButton*) sender;

- (void) sendShare:(UIButton*) sender;

- (void) exitShare:(UIButton*) sender;



@end
