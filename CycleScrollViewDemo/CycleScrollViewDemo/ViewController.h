//
//  ViewController.h
//  CycleScrollViewDemo
//
//  Created by 王金宇 on 13-4-11.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CycleScrollView.h"

@interface ViewController : UIViewController<CycleScrollViewDelegate, CYcleScrollViewDataSource>
{
    NSMutableArray* views;
}
@end
