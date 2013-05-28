//
//  FirstViewController.m
//  NSNotification_HomeWork
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor redColor]];
        [self makeNotification];
         NSLog(@"==2");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"农民"];
    
    NSLog(@"==1");
}
-(void) makeNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor) name:@"国王死了" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColorToo) name:@"国王诈尸了" object:nil];
}
-(void) changeColor
{
    NSLog(@"农民变色");
    [self.view setBackgroundColor:[UIColor blackColor]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"国王死了" object:nil];
}
-(void) changeColorToo
{
    NSLog(@"农民卧槽");
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"国王诈尸了" object:nil];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
