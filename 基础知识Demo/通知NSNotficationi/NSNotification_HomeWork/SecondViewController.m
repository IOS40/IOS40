//
//  SecondViewController.m
//  NSNotification_HomeWork
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor blueColor]];
        [self makeNotification];
        NSLog(@"==**2");
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"==**1");
    [super viewDidLoad];
    [self setTitle:@"工人"];
  
}
-(void) makeNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor) name:@"国王死了" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColorToo) name:@"国王诈尸了" object:nil];
}
-(void) changeColor
{
    NSLog(@"工人变色");
    [self.view setBackgroundColor:[UIColor blackColor]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"国王死了" object:nil];
}
-(void) changeColorToo
{
    NSLog(@"工人卧槽");
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"国王诈尸了" object:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
