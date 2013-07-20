//
//  ViewController.m
//  CycleScrollViewDemo
//
//  Created by 王金宇 on 13-4-11.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CycleScrollView* cycle = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, LCDW, LCDH - 20)];
    cycle.delegate = self;
    cycle.dataSource = self;
    
    [self.view addSubview:cycle];

}

- (NSArray*)cycleScrollViewContentViews
{
    
    views = [[NSMutableArray alloc] initWithCapacity:10];
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view1.backgroundColor = [UIColor greenColor];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view2.backgroundColor = [UIColor redColor];
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view3.backgroundColor = [UIColor yellowColor];
    
    UIView* view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view4.backgroundColor = [UIColor blueColor];
    
    UIView* view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view5.backgroundColor = [UIColor orangeColor];
    
    UIView* view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 548)];
    view6.backgroundColor = [UIColor purpleColor];
    
    [views addObject:view1];
    [views addObject:view2];
    [views addObject:view3];
    [views addObject:view4];
    [views addObject:view5];
    [views addObject:view6];
    
    return views;
}

- (NSInteger)cycleScrollViewCurrentPage
{
    return 1;
}
- (NSInteger)cycleScrollViewTotalPage
{
    return [views count];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
