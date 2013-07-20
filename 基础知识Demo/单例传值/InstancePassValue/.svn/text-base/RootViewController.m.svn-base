//
//  RootViewController.m
//  InstancePassValue
//
//  Created by 王金宇 on 12-11-27.
//  Copyright (c) 2012年 王金宇. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize showText = _showText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

//实现一个单例，用来传值
+ (id)instance
{
    static RootViewController* pRet = nil;
    if(nil == pRet)
    {
        pRet = [[[RootViewController alloc]init] autorelease];
    }
    return pRet;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self loadShowTextLebel];
    [self loadPushToNextViewControllerButton];
}

//在view上加一个Label用来显示字符串
- (void)loadShowTextLebel
{
    _showText = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, LCDW - 40 , 40)];
    [self.showText setBackgroundColor:[UIColor clearColor]];
    [self.showText setTextAlignment:NSTextAlignmentCenter];
    self.showText.textColor = [UIColor whiteColor];
    self.showText.text = @"Default text";//给label设置一个默认的字符串，传到下一个界面。
    [self.view addSubview:self.showText];
}

//加一个Button用来Push到下一个界面
- (void)loadPushToNextViewControllerButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(20, 80, LCDW - 40, 35)];
    [button setTitle:@"Push to next view" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushToNextView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pushToNextView:(UIButton*)sender
{
    //push到下一个界面，并把label的text传到下一个界面进行修改
    SecondViewController* secondView = [[SecondViewController alloc]initWithString:self.showText.text];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.showText = nil;
    [super dealloc];
}

@end
