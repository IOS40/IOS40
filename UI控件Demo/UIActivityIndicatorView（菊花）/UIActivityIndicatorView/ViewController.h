//
//  ViewController.h
//  UIActivityIndicatorView
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    UIActivityIndicatorView *_indicator;
}

- (void) addActivityIndicator;

- (void) addStartButton;

- (void) addStopButton;

- (void) start:(UIButton*) sender;

- (void) stop:(UIButton*) sender;

@end
