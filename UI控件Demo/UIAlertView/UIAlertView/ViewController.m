//
//  ViewController.m
//  UIAlertView
//
//  Created by Ibokan on 12-12-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addButton];
	
}

- (void) addButton
{
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(5, 5, 310, 100);
    [_button setTitle:@"提示" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(alert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void) alert:(UIButton*) sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"生命不止奋斗不息！" message:@"提示" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0)
    {
        NSLog(@"确定");
    }
    if (buttonIndex == 1)
    {
        NSLog(@"取消");
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
