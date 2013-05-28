//
//  ViewController.h
//  iPhone_Test
//
//  Created by  on 12-9-17.
//  Copyright (c) 2012年 cofortune. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#import "ASIHTTPRequest.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    CGPoint _prePoint;
}

@property (retain, nonatomic) IBOutlet UITableView *tableview;

@property (retain, nonatomic) NSMutableArray *dataMutableArray;

@end
