//
//  SensorViewController.h
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-21.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyIndicatorView.h"
@interface SensorViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    MyIndicatorView* _indicatorView;
    
}
@property(strong,nonatomic) NSMutableArray *sensorArray;
@property(strong,nonatomic) NSMutableData *finalData;
@property(strong,nonatomic) NSString *deviceId;
@property(strong,nonatomic) UITableView *tableView;
- (id)initWithId:(NSString*)aId;
@end

