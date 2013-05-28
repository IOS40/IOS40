//
//  DownTableView.h
//  HTTPDownloadResume
//
//  重载TableView
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTP/ASIHTTPRequest.h"
#import "ASIHTTP/ASINetworkQueue.h"

@interface UIProgressView (ProgressViewCateGory)
- (void)setProgress:(float)newProgress;
@end

@class CCViewController;
@class CCDownViewController;

@interface CCDownTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain) NSMutableArray* tableArray;
@property (nonatomic,retain) NSMutableArray* viewArray;         //CCDownloadView数组
@property (nonatomic,retain) NSMutableArray* requestQueue;      //下载队列
@property (nonatomic,retain) UIProgressView* totalProgressView; //总的下载进度

@property  BOOL bFail;

- (CCDownTableView*) initWithArray:(NSArray*) aArray;                       //初始化
- (void) didDownloadError:(ASIHTTPRequest*) aRequest;                       //下载出错时的回调
- (void) didFinishdownload:(NSString*) aFilePath viewIndex:(int) aViewIndex;//完成下载后的回调，涉及到预览图片的切换

- (void) buildConnecting;                   //建立连接（未开始）
- (void) reConnecting:(int) aIndex;         //重新建立链接
- (void) setDownloadArray:(NSArray*) aArray;//设置tableView的数组通过数组的大小确定重用CELL数量
- (void) dealloc;

@end
