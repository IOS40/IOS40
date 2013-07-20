//
//  CycleScrollDemo.h
//  CodeAccumulate
//
//  Created by 王金宇 on 13-4-10.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"

@interface CycleScrollDemo : UIViewController<CycleScrollViewDataSource, CycleScrollViewDelegate>

@property (strong, nonatomic) CycleScrollView *cycleView;
@property (strong, nonatomic) NSMutableArray*  contentViews;
@end
