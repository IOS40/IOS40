//
//  RootTableViewController.h
//  UI_SearchDisplayCOntroller
//
//  Created by Ibokan on 12-11-16.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewController : UITableViewController<UISearchDisplayDelegate>

@property(strong, nonatomic)NSMutableArray* dataList;

@property(strong, nonatomic)NSMutableArray* searchResults;

@property(strong, nonatomic)UISearchDisplayController* searchDisplay;

- (void)loadDataList;

- (void)loadSearchBar;

@end
