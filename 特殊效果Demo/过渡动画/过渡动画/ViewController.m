//
//  ViewController.m
//  过渡动画
//
//  Created by Ibokan on 12-11-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

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
    [self.view addSubview:[self nextView]];//显示初始图片
}

//触摸画面时显示过渡动画效果
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(![UIView areAnimationsEnabled])//如果非动画可运行状态则返回
    {
        [self.nextResponder touchesEnded:touches withEvent:event];
        return;
    }
    static UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromLeft;//过渡动画初始设置
    UIView *nextView = [self nextView];
    //创建下一个画面（UIView）
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop)];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [[self.view viewWithTag:kTagViewForTransitionTest] removeFromSuperview];
    [self.view addSubview:nextView];
    [UIView commitAnimations ];
    
    [UIView setAnimationsEnabled:NO];//暂时将动画设置为无效状态
    
    if(UIViewAnimationTransitionCurlDown < ++transition)//切换过渡动画效果
    {
        transition = UIViewAnimationTransitionFlipFromLeft;
    }
}

//创建下一动画的私有方法
-(UIView*)nextView
{
    static BOOL isFront = YES;
    UIImage *image;
    if(isFront)
    {
        image = [UIImage imageNamed:@"dd.png"];//表面图片
    }
    else
    {
        image = [UIImage imageNamed:@"star.png"];//里层图片
    }
    isFront = (YES != isFront);
    UIView *view = [[[UIImageView alloc] initWithImage:image] autorelease];
    view.tag = kTagViewForTransitionTest;
    view.frame = self.view.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view.contentMode = UIViewContentModeScaleToFill;
    return view;
}

//动画结束时被调用，从新将动画置为有效
-(void)animationDidStop
{
    [UIView setAnimationsEnabled:YES];
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
