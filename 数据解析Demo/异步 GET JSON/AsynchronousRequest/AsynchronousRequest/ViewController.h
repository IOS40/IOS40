//
//  ViewController.h
//  AsynchronousRequest
//
//  Created by Ibokan on 12-12-26.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDataDelegate,NSURLConnectionDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableData *_receiveData;
    
    NSMutableArray *_titleArray;
    
    NSMutableArray *_imageArray;
    
    UITableView *_tableView;
}

@property (strong, nonatomic) NSMutableData *receiveData;

@property (strong, nonatomic) NSMutableArray *titleArray;

@property (strong, nonatomic) NSMutableArray *imageArray;

@property (strong, nonatomic) UITableView *tableView;

@end
