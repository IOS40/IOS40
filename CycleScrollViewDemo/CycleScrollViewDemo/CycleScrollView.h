//
//  CycleScrollView.h
//  CycleScrollViewDemo
//
//  Created by 王金宇 on 13-4-11.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#define LCDW [[UIScreen mainScreen] bounds].size.width
#define LCDH [[UIScreen mainScreen] bounds].size.height

#import <UIKit/UIKit.h>

typedef enum
{
    verticalDirection,      //垂直方向
    horizontalDirection     //水平方向
}ContentDirection;

@class CycleScrollView;

@protocol CycleScrollViewDelegate <NSObject>

- (void)cycleScrollView:(CycleScrollView*)cycleScrollView didScrolledToIndex:(NSInteger)index;
- (void)cycleScrollView:(CycleScrollView*)cycleScrollView didSelectedIndex:(NSInteger)index;

@end

@protocol CYcleScrollViewDataSource <NSObject>

- (NSArray*) cycleScrollViewContentViews;
- (NSInteger)cycleScrollViewCurrentPage;
- (NSInteger)cycleScrollViewTotalPage;
- (ContentDirection)cycleScrollViewScrollDirection;

@end

@interface CycleScrollView : UIView<UIScrollViewDelegate>
{
    NSInteger   totalPage;
    NSInteger   currentPage;
}

@property(nonatomic, assign, setter = cycleViewDelegate:)id<CycleScrollViewDelegate>   delegate;
@property(nonatomic, assign, setter = cycleViewDataSource:)id<CYcleScrollViewDataSource> dataSource;

@property(nonatomic, assign)ContentDirection            direction;

@property(nonatomic, strong)UIScrollView*               scrollView;

@property(nonatomic, strong)UIView*                     previousView;
@property(nonatomic, strong)UIView*                     currentView;
@property(nonatomic, strong)UIView*                     nextView;

@property(nonatomic, strong)NSArray*                    contentViews;



@end
