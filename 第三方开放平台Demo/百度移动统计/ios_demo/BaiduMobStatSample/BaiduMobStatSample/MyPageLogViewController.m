//
//  MyPageLogViewController.m
//  BaiduMobStatSample
//
//  Created by jaygao on 11-11-4.
//  Copyright (c) 2011年 Baidu. All rights reserved.
//

#import "MyPageLogViewController.h"
#import "BaiduMobStat.h"

@implementation MyPageLogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) viewDidAppear:(BOOL)animated
{
    NSString* cName = [NSString stringWithFormat:@"%@",  self.tabBarItem.title, nil];
    [[BaiduMobStat defaultStat] pageviewStartWithName:cName];

}

-(void) viewDidDisappear:(BOOL)animated
{
    NSString* cName = [NSString stringWithFormat:@"%@", self.tabBarItem.title, nil];
    [[BaiduMobStat defaultStat] pageviewEndWithName:cName];
}

- (void) triggerEx:(id) sender
{
    NSString* a = @"";
    [a errorjay];
}

-(void)logEventWithDurationTime:(id) sender
{
    static Boolean isStart = false;
    if(isStart == false)
    {
        BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
        [statTracker eventStart:@"another" eventLabel:@"aaa"];
        isStart = true;
        [(UIButton*) sender setTitle:@"event end" forState:UIControlStateNormal];
    }
    else{
        BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
        [statTracker eventEnd:@"another" eventLabel:@"aaa"];
        isStart = false;
        [(UIButton*) sender setTitle:@"event start" forState:UIControlStateNormal];
    }
}

-(void)logEventClick:(id) sender
{
    BaiduMobStat* statTracker = [BaiduMobStat defaultStat];
    [statTracker logEvent:@"another" eventLabel:@"sss"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    
    UIView* animateView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 100, 100)];
    animateView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animateView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:100];
    [UIView setAnimationDuration:3];
    animateView.frame = CGRectMake(30, 30, 30 , 30);
    [UIView commitAnimations];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 160, 160, 50);
    [btn setTitle:@"exception" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(triggerEx:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* logbtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logbtn.frame = CGRectMake(10, 220, 160 , 50);
    [logbtn setTitle:@"event trigger" forState:UIControlStateNormal];
    [self.view addSubview:logbtn];
    [logbtn addTarget:self action:@selector(logEventClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10, 280, 160, 50);
    [btn2 setTitle:@"event start" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(logEventWithDurationTime:) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
