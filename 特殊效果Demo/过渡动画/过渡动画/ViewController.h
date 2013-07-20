//
//  ViewController.h
//  过渡动画
//
//  Created by Ibokan on 12-11-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
static const NSInteger kTagViewForTransitionTest = 1;
@interface ViewController : UIViewController
-(UIView*)nextView;
-(void)animationDidStop;
@end
