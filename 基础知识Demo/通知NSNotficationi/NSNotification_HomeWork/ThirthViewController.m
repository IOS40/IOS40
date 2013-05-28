//
//  ThirthViewController.m
//  NSNotification_HomeWork
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ThirthViewController.h"

@interface ThirthViewController ()

@end

@implementation ThirthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"国王"];
	// Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(10, 460-44-100-10-49, 100, 100)];
    [button setTitle:@"国王死了" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button1 setFrame:CGRectMake(320-10-100, 460-44-100-10-49, 100, 100)];
    [button1 setTitle:@"国王诈尸了" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(changeColorToo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

-(void) changeColor:(UIButton*)sender
{
    NSNotification *notification = [NSNotification notificationWithName:@"国王死了" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
-(void) changeColorToo:(UIButton*)sender
{
    NSNotification *notification = [NSNotification notificationWithName:@"国王诈尸了" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
