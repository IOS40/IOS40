//
//  ViewController.m
//  testNet
//
//  Created by b126 on 12-4-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CheckNetwork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 320, 30);
    [button addTarget:self action:@selector(onClickbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"检测网络" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)onClickbutton:(id)sender
{
    
	NSLog(@"===%d",[CheckNetwork isExistenceNetwork]);
    if([CheckNetwork isExistenceNetwork])
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 320, 30)];
        label.text = @"有网";
        [self.view addSubview:label];
    }
    else
    {
        UIAlertView *myalert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"未检测到网络" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil,nil];
		[myalert show];
		[myalert release];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
