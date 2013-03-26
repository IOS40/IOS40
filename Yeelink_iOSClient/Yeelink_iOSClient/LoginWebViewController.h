//
//  TuDouWebViewController.h
//  TuDouTSix
//
//  Created by Ibokan on 12-12-12.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginWebViewController : UIViewController<UIWebViewDelegate>
{
    UIActivityIndicatorView *_activiyIndicatorView;
    UIView *_childView;
    UIWebView *_webView;
}
@property (strong ,nonatomic)UIBarButtonItem *rewindButton;
@property (strong ,nonatomic)UIBarButtonItem *forwardButton;
@property (strong ,nonatomic)UIBarButtonItem *refreshButton;

@end
