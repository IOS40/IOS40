//
//  ViewController.m
//  SinaWeibo
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize shareButton = _shareButton;
@synthesize textView = _textView;
@synthesize shareView = _shareView;
@synthesize indicator = _indicator;

- (SinaWeibo*)sinaWeibo
{
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.sinaWeibo.delegate = self;
    return delegate.sinaWeibo;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_indicator setFrame:CGRectMake(0, 0, 50, 50)];
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];
    
    [self addButton];
}

- (void) addButton
{
    _shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.shareButton setFrame:CGRectMake(10, 10, 300, 50)];
    
    [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
    
    [self.shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.shareButton];
}

- (void) addShareView
{
    _shareView = [[UIView alloc] initWithFrame:CGRectMake(20, 30, 280, 200)];
    _shareView.layer.masksToBounds = YES;
    _shareView.layer.cornerRadius = 6.0;
    _shareView.layer.borderWidth = 1.0;
    _shareView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_shareView];
    
    UIButton *quXiaoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [quXiaoButton setFrame:CGRectMake(5, 5, 60, 30)];
    [quXiaoButton setTitle:@"取消" forState:UIControlStateNormal];
    [quXiaoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [quXiaoButton addTarget:self action:@selector(removeShare:) forControlEvents:UIControlEventTouchUpInside];
    [_shareView addSubview:quXiaoButton];
    
    UIButton *fenXiangButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fenXiangButton setFrame:CGRectMake(280-65, 5, 60, 30)];
    [fenXiangButton setTitle:@"发送" forState:UIControlStateNormal];
    [fenXiangButton addTarget:self action:@selector(sendShare:) forControlEvents:UIControlEventTouchUpInside];
    [fenXiangButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_shareView addSubview:fenXiangButton];
    
    UIButton *tuiChuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [tuiChuButton setFrame:CGRectMake(5, 165, 100, 30)];
    [tuiChuButton setTitle:@"退出登陆" forState:UIControlStateNormal];
    [tuiChuButton addTarget:self action:@selector(exitShare:) forControlEvents:UIControlEventTouchUpInside];
    [tuiChuButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_shareView addSubview:tuiChuButton];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(55, 5, 280-110, 30)]autorelease];
    label.textAlignment = UITextAlignmentCenter;
    label.text = @"新浪微博";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:[[UIFont familyNames] objectAtIndex:0] size:20];
    [_shareView addSubview:label];
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 40, 270, 120)];
    _textView.layer.cornerRadius = 6.0;
    [_textView becomeFirstResponder];
    [_textView setTextAlignment:UITextAlignmentLeft];
    [_textView setBackgroundColor:[UIColor whiteColor]];
    [_textView becomeFirstResponder];
    _textView.keyboardType = UIKeyboardTypeASCIICapable;
    [_shareView addSubview:_textView];
}

//分享按钮响应方法
- (void) share:(UIButton*) sender
{
    SinaWeibo *sinaWeibo = [self sinaWeibo];
    
    BOOL authValid = sinaWeibo.isAuthValid;
    
    if (!authValid)
    {
        [sinaWeibo logIn];
    }
    else
    {
        [self addShareView];
        [_textView becomeFirstResponder];
    }
    
}

//登陆成功后回调方法
- (void) sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    [self addShareView];
    [_textView becomeFirstResponder];
}

//取消按钮回调方法
- (void) removeShare:(UIButton*) sender
{
    [_shareView removeFromSuperview];
}

//发送按钮回调方法
- (void) sendShare:(UIButton*) sender
{
    NSString *postStatusText = self.textView.text;
    
    SinaWeibo *sinaWeibo = [self sinaWeibo];
    
    [sinaWeibo requestWithURL:@"statuses/updates.json" params:[NSMutableDictionary dictionaryWithObjectsAndKeys:postStatusText,@"status", nil] httpMethod:@"POST" delegate:self];
    
    [_shareView removeFromSuperview];
    
    [self.indicator startAnimating];
}

//退出登陆回调方法
- (void) exitShare:(UIButton*) sender
{
    SinaWeibo *sinaWeibo = [self sinaWeibo];
    
    [sinaWeibo logOut];
    
    [_shareView removeFromSuperview];
    
    NSLog(@"退出登陆");
}

//请求完成回调该方法
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    [self.indicator stopAnimating];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"发送成功" message:@"提示" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    [alert release];
    NSLog(@"发送成功");
}

//请求失败回调该方法
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    [self.indicator stopAnimating];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"发送失败,请检测网络链接" message:@"提示" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
    [alert release];
    NSLog(@"发送失败");
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
