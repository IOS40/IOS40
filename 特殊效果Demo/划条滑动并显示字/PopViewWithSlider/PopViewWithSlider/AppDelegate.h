//
//  AppDelegate.h
//  PopViewWithSlider
//
//  Created by 东子 Adam on 12-5-8.
//  Copyright (c) 2012年 热频科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSTimer *timer;
    UISlider *mSlider;
    UILabel *popView;
}

@property (strong, nonatomic) UIWindow *window;

@end
