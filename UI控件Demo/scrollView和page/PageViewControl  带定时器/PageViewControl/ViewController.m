//
//  ViewController.m
//  PageViewControl
//
//  Created by Ibokan on 12-12-24.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addScrollView];
    [self addPageControl];
    [self addTimer];
    
    
}



- (void) addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460 - 20)];
    
    _scrollView.contentSize = CGSizeMake(320*5, 460 - 20);
    
    _scrollView.tag = 200;
    
    _scrollView.bounces = NO;//边缘反弹效果关闭
    
    _scrollView.backgroundColor = [UIColor yellowColor];
    
    _scrollView.showsHorizontalScrollIndicator = NO;//不显示横向滚动条
    
    _scrollView.showsVerticalScrollIndicator = NO;//不显示纵向滚动条
    
    _scrollView.pagingEnabled = YES;//设置关联pageControl开启
    
    _scrollView.delegate = self;
    
    NSArray *imageArray = [[NSArray alloc] initWithObjects:@"h1",@"h2",@"h3",@"h4",@"h5", nil ];
    
    for (int i = 0; i < 5; i++)
    {
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[imageArray objectAtIndex:i] ofType:@"jpeg"]];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        [imageView setFrame:CGRectMake(i*320, 0, 320, 460 - 20)];
        
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];
}
- (void) addPageControl
{
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 460 - 20, 320, 20)];
    
    _pageControl.numberOfPages = 5.0;//页数
    
    _pageControl.currentPage = 0.0;//当前页数
    
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_pageControl];
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView//滑动图片圆点跟着动
{    
    CGFloat pageWidth = scrollView.frame.size.width;
    
    int page = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    _pageControl.currentPage = page;
}

- (void) changePage:(UIPageControl*) sender//点击圆点图片跟着动
{
    int currentPage = (int)sender.currentPage;
    
    UIScrollView *scrollView = (UIScrollView*)[self.view viewWithTag:200];
    
    if (currentPage > 0)
    {
        [scrollView setContentOffset:CGPointMake(320*currentPage, 0) animated:YES];
    }
    else
    {
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}

- (void) addTimer//添加定时器
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerChange:) userInfo:nil repeats:YES];
    
    [timer fire];
}

- (void) timerChange:(id) sender//定时器调用方法
{
    static int i = 0;
    
    _pageControl.currentPage = i;
    
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width*_pageControl.currentPage, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    
    i++;
    
    if (i > 4)
    {
        i = 0;
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
