//
//  ViewController.m
//  TextView
//
//  Created by Ibokan on 12-12-21.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 310, 100)];
    
    [_textView becomeFirstResponder];//textView是第一响应者，加载视图键盘自动弹出
    
    [_textView setKeyboardType:UIKeyboardTypeASCIICapable];//键盘类型
    
    [_textView setReturnKeyType:UIReturnKeyGo];//return键类型
    
    [_textView setEnablesReturnKeyAutomatically:YES];//return键在文本空白情况下的状态
    
    [_textView setAutocapitalizationType:UITextAutocapitalizationTypeNone];//Shift键的自动无效功能
    
    [_textView setSecureTextEntry:YES];//将输入文本设置为输入密码状态（只有textField好使，textView不好使）
    
    [_textView setAutocorrectionType:UITextAutocorrectionTypeYes];//字符串自动矫正功能开启
    
    [self.view addSubview:_textView];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textView resignFirstResponder];
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
