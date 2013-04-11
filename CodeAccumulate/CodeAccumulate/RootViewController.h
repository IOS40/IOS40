//
//  RootViewController.h
//  CodeAccumulate
//
//  Created by 王金宇 on 13-4-10.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong)NSMutableArray* demoNameArray;

@end
