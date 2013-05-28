//
//  ViewController.m
//  TextField
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
	
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 30)];
    
    [_textField setBorderStyle:UITextBorderStyleRoundedRect];//设置文本框的样式:圆角四边形+阴影
    
    [_textField becomeFirstResponder];//加载页面直接弹出键盘
    
    [_textField setTextAlignment:UIControlContentVerticalAlignmentCenter];//文本上下居中对齐
    
    [_textField setTextAlignment:UITextAlignmentLeft];//文本左右左对齐
    
    [_textField setPlaceholder:@"请输入信息"];//提示信息的设置
        
    [_textField setAutocorrectionType:UITextAutocorrectionTypeNo];//关闭字符串自动矫正功能
    
    [_textField setBackgroundColor:[UIColor grayColor]];//设置文本框背景色
    
    [_textField setTextColor:[UIColor blackColor]];//设置文本字体颜色
    
    [_textField setFont:[UIFont systemFontOfSize:20.0]];//设置文本字体大小
    
    [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];//编辑文本时带清空按钮
    
    [_textField setClearsOnBeginEditing:YES];//编辑时清空文本

    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
    [_textField setRightView:button];//在文本右侧添加按钮
    [_textField setRightViewMode:UITextFieldViewModeUnlessEditing];//不编辑文本时才显示按钮(必须打上字才看得出来)

    [_textField setDelegate:self];//设置UITextFieldDelegate的代理
    
    [self.view addSubview:_textField];
}


/*********************************
 
 UITextFieldDelegate协议的回调方法
 
 *********************************/

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField//编辑开始前被调用
{
    return NO;//返回No时，编辑将不会开始
}
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField//编辑结束前被调用
{
    return NO;//返回No时，编辑将不会结束
}

- (void) textFieldDidBeginEditing:(UITextField *)textField//编辑开始后被调用
{
    
}
- (void) textFieldDidEndEditing:(UITextField *)textField//编辑结束后被调用
{
    
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string//文本修改前被调用（range为改变范围，string中传入修改后的字符）
{
    return NO;//返回No时，修改将不会被反映
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
}

- (BOOL) textFieldShouldClear:(UITextField *)textField//文本输入清空按钮被触摸时被调用
{
    return YES;//返回YES时，输入框内容被清空。返回No时，保持原状
}




- (void) go:(id)sender
{
    NSLog(@"走你!");
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
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
