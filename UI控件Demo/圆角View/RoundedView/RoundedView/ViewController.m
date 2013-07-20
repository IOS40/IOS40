//
//  ViewController.m
//  RoundedView
//
//  Created by Ibokan on 12-12-18.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*******************************************************
 
 需要添加库文件QuartzCore.framework，本事例也适用imageView
 
 *******************************************************/
- (void)viewDidLoad
{
    [super viewDidLoad];
	

    UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(5, 50, 310, 200)];
    aView.layer.masksToBounds = YES;
    aView.layer.cornerRadius = 6.0;//设置拐角半径
    aView.layer.borderWidth = 20.0;//设置边框线宽
    aView.layer.borderColor = [[UIColor whiteColor] CGColor];//设置边框线的颜色
    [self.view addSubview:aView];
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
