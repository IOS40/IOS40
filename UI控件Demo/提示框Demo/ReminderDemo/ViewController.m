//
//  ViewController.m
//  ReminderDemo
//
//  Created by Lucifer on 13-5-24.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickBeginBtn:(UIButton *)sender
{
    [self beginAnimation];
}
- (IBAction)clickEndBtn:(UIButton *)sender
{
    [self endAnimation];
}
- (void)beginAnimation
{
    self.locationLabel.text = @"您输入的邮箱有误！";
    
    [UIView animateWithDuration:0.2 animations:^{
    
        self.locationView.frame = CGRectMake(21, 322/2, 278, 138);
    }];
}
- (void)endAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.locationView.frame = CGRectMake(21, -138, 278, 138);
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_beginBtn release];
    [_endBtn release];
    [_locationView release];
    [_locationLabel release];
    [super dealloc];
}
@end
