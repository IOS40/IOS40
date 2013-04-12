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
    _contentViews = [[NSMutableArray alloc]initWithCapacity:10];

    _cycleView = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, LCDW, LCDH - 20 - 44)];
    self.cycleView.delegate = self;
    self.cycleView.dataSource = self;
    
    [self.view addSubview:self.cycleView];
}

- (NSArray*)cycleScrollViewContentViews
{
    for (int i = 1; i < 13; i++)
    {
        NSString* nameString = [NSString stringWithFormat:@"%d@2x",i];
        UIImage* image = [[UIImage alloc] initWithContentsOfFile:App_ContentFile(nameString, @"png")];
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.cycleView.frame.size.width, self.cycleView.frame.size.height)];
        [imageView setImage:image];
        
        [self.contentViews addObject:imageView];
        
        [image release];
        [imageView release];
    }
    
    return self.contentViews;
}

- (NSInteger)cycleScrollViewCurrentPage
{
    return 1;
}
- (NSInteger)cycleScrollViewTotalPage
{
    return [self.contentViews count];
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
    self.contentViews = nil;
    [super dealloc];
}
@end
