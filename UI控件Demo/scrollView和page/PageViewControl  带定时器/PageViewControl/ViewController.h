//
//  ViewController.h
//  PageViewControl
//
//  Created by Ibokan on 12-12-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

{
    UIScrollView *_scrollView;
    
    UIPageControl *_pageControl;
    
}

- (void) addScrollView;

- (void) addPageControl;

- (void) changePage:(UIPageControl*) sender;

- (void) addTimer;

- (void) timerChange:(id) sender;

@end
