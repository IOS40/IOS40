//
//  ViewController.m
//  UI_Animation
//
//  Created by Ibokan on 12-11-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)pressButton:(id)sender 
{
    UIButton *button = (UIButton*)sender;//按钮参数强转
    if(0 == button.tag)
    {
        //需要在frameworks中添加QuartzCore.framework 
        //在接口程序中加上头文件 #import <QuartzCore/QuartzCore.h>
        CATransition *animation = [CATransition animation];/*创建动画开始*/
        animation.duration = 1;/* 间隔时间*/
        animation.type = kCATransitionFade;/* 各种动画效果*/
        animation.subtype = kCATransitionFromLeft;/* 动画方向*/
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ; /* 动画的开始与结束的快慢*/
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];/*视图转换*/
        
        //另外加一句,transition在申请时用的是+方法,所以不需要自己进行release ,在层上添 加后不要认为retainCount已经+1,就还要release
        //降效果作用到view的层上面 
        //实际上CATransition类中还有一个属性是removedOnCompletion,是此动画执行完后 会自动remove,默认值为true
        
        [self.view.layer/*在想添加CA动画的VIEW的层上添加此代码*/ addAnimation:animation forKey:@"exchange"];//降效果作用到view的层上面
        
    }
    if(1 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = kCATransitionPush;
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(2 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(3 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = kCATransitionMoveIn;
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(4 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = @"cube";
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(5 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = @"suckEffect";
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(6 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = @"oglFlip";
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
    if(7 == button.tag)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 1;
        animation.type = @"rippleEffect";
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        [self.view.layer addAnimation:animation forKey:@"exchange"];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
