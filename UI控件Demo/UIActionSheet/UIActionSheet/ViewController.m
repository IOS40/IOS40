//
//  ViewController.m
//  UIActionSheet
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
    
    [self addButton];
	
}

- (void) addButton
{
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [_button setTitle:@"提示" forState:UIControlStateNormal];
    
    [_button setFrame:CGRectMake(5, 5, 310, 100)];
    
    [_button addTarget:self action:@selector(actionSheet:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
}

- (void) actionSheet:(UIButton*) sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"你幸福吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"幸福" otherButtonTitles:@"不幸福", nil];
    
    [actionSheet showInView:self.view];
}


/*********************************************************************
 
 隐藏actionSheet：dismissWithClickedButtonIndex:<#(NSInteger)#> animated:<#(BOOL)#>
 
 *********************************************************************/
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex;
{
    if (buttonIndex == 0)
    {
        NSLog(@"幸福");
        
    }
    if (buttonIndex == 1)
    {
        NSLog(@"不幸福");
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
