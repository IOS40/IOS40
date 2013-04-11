//
//  CycleScrollDemo.m
//  CodeAccumulate
//
//  Created by 王金宇 on 13-4-10.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import "CycleScrollDemo.h"

@interface CycleScrollDemo ()

@end

@implementation CycleScrollDemo


- (void)viewDidLoad
{
    [super viewDidLoad];
    CycleScrollView* cycle = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, LCDW, LCDH - 20 - 44)];
    cycle.delegate = self;
    cycle.dataSource = self;
    
    [self.view addSubview:cycle];
    
}

- (NSArray*)cycleScrollViewContentViews
{
    
    self.views = [[NSMutableArray alloc] initWithCapacity:10];
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view1.backgroundColor = [UIColor greenColor];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view2.backgroundColor = [UIColor redColor];
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view3.backgroundColor = [UIColor yellowColor];
    
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view4.backgroundColor = [UIColor blueColor];
    
    UIView* view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view5.backgroundColor = [UIColor orangeColor];
    
    UIView* view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
    view6.backgroundColor = [UIColor purpleColor];
    
    [self.views addObject:view1];
    [self.views addObject:view2];
    [self.views addObject:view3];
    [self.views addObject:view4];
    [self.views addObject:view5];
    [self.views addObject:view6];
    
    return self.views;
}

- (NSInteger)cycleScrollViewCurrentPage
{
    return 1;
}
- (NSInteger)cycleScrollViewTotalPage
{
    return [self.views count];
}

- (ContentDirection)cycleScrollViewScrollDirection
{
    return horizontalDirection;
}

- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didScrolledToIndex:(NSInteger)index
{
    NSLog(@"index = %d",index);
}

- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didSelectedIndex:(NSInteger)index
{
    NSLog(@"select = %d",index);
}
- (void)dealloc
{
    self.cycleView = nil;
    [super dealloc];
}
@end
