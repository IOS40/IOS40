//
//  ViewController.m
//  UIActivityIndicatorView
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addActivityIndicator];
    [self addStartButton];
    [self addStopButton];
    
    
}

- (void) addActivityIndicator
{
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];//初始化菊花，并设定样式
    
    [_indicator setFrame:CGRectMake(0,0,50,50)];
    
    _indicator.center = self.view.center;
    
    [self.view addSubview:_indicator];
}

- (void) addStartButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setFrame:CGRectMake(5, 5, 120, 60)];
    
    [button setTitle:@"开始" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(start:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}
- (void) addStopButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [button setFrame:CGRectMake(320 - 125, 5, 120, 60)];
    
    [button setTitle:@"停止" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void) start:(UIButton*) sender
{
    [_indicator startAnimating];
    
    if ([_indicator isAnimating])//检测当前动画是否在运动
    {
        NSLog(@"我在运动");
    }
    else
    {
        NSLog(@"我在休息");
    }
}
- (void) stop:(UIButton*) sender
{
    [_indicator stopAnimating];
    
    _indicator.hidesWhenStopped = NO;//动画停止后默认是隐藏的，把他设置为显示
    
    if ([_indicator isAnimating])
    {
        NSLog(@"我在运动");
    }
    else
    {
        NSLog(@"我在休息");
    }
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
