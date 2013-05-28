//
//  CCViewController.h
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCDownViewController.h"
#import "CCDownloadView.h"
#import "CCDownloadInfo.h"
#import "CCDownTableView.h"

@interface CCViewController : UIViewController

//@property (nonatomic,retain) CCDownTableView* downTableView;

@property (nonatomic,retain) CCDownViewController* downViewController;

@end
