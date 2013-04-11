//
//  CycleScrollView.m
//  CycleScrollViewDemo
//
//  Created by 王金宇 on 13-4-11.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import "CycleScrollView.h"

@interface CycleScrollView ()

- (void)initObjects;

@end

@implementation CycleScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
    }
    return self;
}

- (void)cycleViewDelegate:(id)delegate
{
    _delegate = delegate;
}

- (void)cycleViewDataSource:(id)dataSource
{
    _dataSource = dataSource;
    if([self.dataSource respondsToSelector:@selector(cycleScrollViewContentViews)])
    {
        self.contentViews = [self.dataSource cycleScrollViewContentViews];
    }
    if([self.dataSource respondsToSelector:@selector(cycleScrollViewCurrentPage)])
    {
        currentPage = [self.dataSource cycleScrollViewCurrentPage];
    }
    if([self.dataSource respondsToSelector:@selector(cycleScrollViewTotalPage)])
    {
        totalPage = [self.dataSource cycleScrollViewTotalPage];
    }
    if([self.dataSource respondsToSelector:@selector(cycleScrollViewScrollDirection)])
    {
        self.direction = [self.dataSource cycleScrollViewScrollDirection];
    }
    [self initObjects];
}

- (void)initObjects
{
    NSLog(@"%d",[self.contentViews count]);
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator   = NO;
    
    if(self.direction == verticalDirection)
    {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height * 3);
        self.previousView = [[UIView alloc]initWithFrame:CGRectMake(0 , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.currentView  = [[UIView alloc]initWithFrame:CGRectMake(0 , 0 + self.scrollView.frame.size.height, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.nextView     = [[UIView alloc]initWithFrame:CGRectMake(0 , 0 + self.scrollView.frame.size.height * 2, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    }
    else
    {
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 3, self.scrollView.frame.size.height);
        self.previousView = [[UIView alloc]initWithFrame:CGRectMake(0 , 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.currentView  = [[UIView alloc]initWithFrame:CGRectMake(0 + self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        self.nextView     = [[UIView alloc]initWithFrame:CGRectMake(0 + self.scrollView.frame.size.width * 2, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    }

    [self addSubview:self.scrollView];
    [self reloadCycleScrollView];
}

- (void)reloadCycleScrollView
{
    NSArray* subViews = [self.scrollView subviews];
    if([subViews count] != 0)
    {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    [self getDisplayViewsWithCurrentPage:currentPage];
    
    if(self.direction == horizontalDirection)
    {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width, 0)];
    }
    else
    {
        [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.frame.size.height)];
    }
}

- (NSArray*)getDisplayViewsWithCurrentPage:(NSInteger)currentP
{
    int prePage = [self validPageValue:currentP - 1];
    int nextPage =    [self validPageValue:currentP + 1];
    
    for (UIView* view in self.previousView.subviews)
    {
        [view removeFromSuperview];
    }
    for (UIView* view in self.currentView.subviews)
    {
        [view removeFromSuperview];
    }
    for (UIView* view in self.nextView.subviews)
    {
        [view removeFromSuperview];
    }
    
    [self.previousView addSubview:[self.contentViews objectAtIndex:prePage - 1]];
    [self.currentView addSubview:[self.contentViews objectAtIndex:currentP - 1]];
    [self.nextView addSubview:[self.contentViews objectAtIndex:nextPage - 1]];

    [self.scrollView addSubview:self.previousView];
    [self.scrollView addSubview:self.currentView];
    [self.scrollView addSubview:self.nextView];
    
    return nil ;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int x = scrollView.contentOffset.x;
    int y = scrollView.contentOffset.y;
    // 往下翻一张
    if((self.direction == horizontalDirection))
    {
        if(x >= (2 * self.scrollView.frame.size.width))
        {
            currentPage = [self validPageValue:currentPage + 1];
            [self reloadCycleScrollView];
        }
        if(x <= 0)
        {
            currentPage = [self validPageValue:currentPage - 1];
            [self reloadCycleScrollView];
        }
    }
    else
    {
        if(y >= (2 * self.scrollView.frame.size.height))
        {
            currentPage = [self validPageValue:currentPage + 1];
            [self reloadCycleScrollView];
        }
        if(y <= 0)
        {
            currentPage = [self validPageValue:currentPage - 1];
            [self reloadCycleScrollView];
        }

    }
}

- (int)validPageValue:(NSInteger)value {
    
    if(value == 0)
    {
        value = totalPage;                   // value＝1为第一张，value = 0为前面一张
    }
    if(value == totalPage + 1)
    {
        value = 1;
    }
    return value;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([self.delegate respondsToSelector:@selector(cycleScrollView:didScrolledToIndex:)])
    {
        [self.delegate cycleScrollView:self didScrolledToIndex:currentPage];
    }
    if([self.delegate respondsToSelector:@selector(cycleScrollView:didSelectedIndex:)])
    {
        [self.delegate cycleScrollView:self didScrolledToIndex:currentPage];
    }
}


- (void)dealloc
{
    self.scrollView     =   nil;
    self.previousView   =   nil;
    self.currentView    =   nil;
    self.nextView       =   nil;
    self.contentViews   =   nil;
    
    [super dealloc];
}
@end
