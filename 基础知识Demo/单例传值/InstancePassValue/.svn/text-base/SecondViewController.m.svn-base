//
//  SecondViewController.m
//  InstancePassValue
//
//  Created by 王金宇 on 12-11-27.
//  Copyright (c) 2012年 王金宇. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize textField = _textField;
@synthesize string = _string;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithString:(NSString*)aString
{
    if(self = [super init])
    {
        self.string = aString;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
    [self loadTextField];
    [self loadPopToBeforeViewControllerButton];
}

- (void)loadTextField
{
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, LCDW - 40, 40)];
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField.text = self.string;
    [self.textField setDelegate:self];
    [self.textField setTextAlignment:NSTextAlignmentCenter];
    [self.textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    
    [self.textField setKeyboardAppearance:UIKeyboardAppearanceAlert];
    [self.textField setReturnKeyType:UIReturnKeyDone];
    [self.textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    
    [self.view addSubview:self.textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isFirstResponder] == YES)
    {
        [textField resignFirstResponder];
    }
    return YES;
}

- (void)loadPopToBeforeViewControllerButton
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(20, 80, LCDW - 40, 35)];
    [button setTitle:@"Pop to before view" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popToBeforeView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)popToBeforeView:(UIButton*)sender
{
    RootViewController* rootViewController = [RootViewController instance];
    rootViewController.showText.text = self.textField.text;
    NSLog(@"%@",rootViewController);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    self.textField = nil;
    self.string = nil;
    [super dealloc];
}

@end
