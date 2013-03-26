//
//  TuDouWebViewController.m
//  TuDouTSix
//
//  Created by Ibokan on 12-12-12.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "LoginWebViewController.h"

@interface LoginWebViewController ()

@end

@implementation LoginWebViewController

@synthesize rewindButton = _rewindButton;
@synthesize forwardButton = _forwardButton;
@synthesize refreshButton = _refreshButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"隐藏" object:nil];
        [self setHidesBottomBarWhenPushed:YES];    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"创客注册"];
    _webView = [[UIWebView alloc]init];
     [_webView setFrame:self.view.bounds];
    [_webView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [_webView setScalesPageToFit:YES];
    [self.view addSubview:_webView];
    [_webView request];
    [self.navigationController setToolbarHidden:NO];
    self.navigationController.toolbar.tintColor =[UIColor blackColor];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.yeelink.net/register"]];
    [_webView loadRequest:request];
    [self loadToobarButton];

    
}
-(void)loadToobarButton   //工具条上追加按钮
{
    
    _rewindButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(rewindDidPush)];
    _forwardButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(forwardDidPush)];
    _refreshButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshDidPush)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *buttons = [NSArray arrayWithObjects:_rewindButton,spacer,_forwardButton,spacer, _refreshButton, nil];
    [self setToolbarItems:buttons animated:YES];
   
    
}

-(void)rewindDidPush
{
    if (_webView.canGoBack)
    {
        [_webView goBack];
    }
}
-(void)forwardDidPush
{
    if (_webView.canGoForward)
    {
        [_webView goForward];
    }
}
-(void)refreshDidPush
{
    [_webView reload];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activiyIndicatorView startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activiyIndicatorView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [_activiyIndicatorView stopAnimating];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation== UIInterfaceOrientationPortrait;
}
- (BOOL)shouldAutorotate
{
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    
    return UIInterfaceOrientationMaskPortrait;
}

@end
