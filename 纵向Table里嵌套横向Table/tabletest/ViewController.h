//
//  ViewController.h
//  tabletest
//
//  Created by renren3 on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoCell.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *portable;
}

@end
