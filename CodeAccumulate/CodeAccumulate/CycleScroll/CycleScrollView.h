//
//  CycleScrollView.h
//  CycleScrollViewDemo
//
//  Created by 王金宇 on 13-4-11.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    verticalDirection,      //垂直方向
    horizontalDirection     //水平方向
}ContentDirection;

@class CycleScrollView;

@protocol CycleScrollViewDelegate <NSObject>

//此代理方法，当cycleScrollView滚动到某一个view的时候调用，index为当前的view的索引
- (void)cycleScrollView:(CycleScrollView*)cycleScrollView didScrolledToIndex:(NSInteger)index;

//此view为点击某一个view时调用，暂时demo里边的没给view加点击的响应，故此方法暂时无效，可以自己把例子里边传进来的view加一个点击的手势什么的，这个看自己
- (void)cycleScrollView:(CycleScrollView*)cycleScrollView didSelectedIndex:(NSInteger)index;

@end

@protocol CycleScrollViewDataSource <NSObject>

//设置CycleScrollView要显示的内容
- (NSArray*) cycleScrollViewContentViews;

//设置当前显示的页码
- (NSInteger)cycleScrollViewCurrentPage;

//设置总页码
- (NSInteger)cycleScrollViewTotalPage;

//设置滚动方向
- (ContentDirection)cycleScrollViewScrollDirection;

@end

@interface CycleScrollView : UIView<UIScrollViewDelegate>
{
    NSInteger   totalPage;
    NSInteger   currentPage;
}

@property(nonatomic, assign, setter = cycleViewDelegate:)id<CycleScrollViewDelegate>   delegate;
@property(nonatomic, assign, setter = cycleViewDataSource:)id<CycleScrollViewDataSource> dataSource;

@property(nonatomic, assign)ContentDirection            direction;

@property(nonatomic, strong)UIScrollView*               scrollView;

@property(nonatomic, strong)UIView*                     previousView;
@property(nonatomic, strong)UIView*                     currentView;
@property(nonatomic, strong)UIView*                     nextView;

@property(nonatomic, strong)NSArray*                    contentViews;



@end
