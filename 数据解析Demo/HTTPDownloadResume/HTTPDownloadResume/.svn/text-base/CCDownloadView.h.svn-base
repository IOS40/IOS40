//
//  DownloadView.h
//  HTTPDownloadResume
//
//  重载的UIView 目的是为将来将View添加到UITableView中时节省时间。
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCDownloadInfo.h"
#import "CCDownTableView.h"

@interface CCDownloadView : UIView

@property (nonatomic,retain) UIImageView* imgView;//下载的图片在下载中显示预览，下载完成后显示下载的图片的预览
@property (nonatomic,retain) UILabel* textNameTitle;//@“名称”
@property (nonatomic,retain) UILabel* textProgressTitle;//进度条的名字 
@property (nonatomic,retain) UILabel* textName;//要下载的文件的名字
@property (nonatomic,retain) UIProgressView* progressView;//进度条
@property (nonatomic,retain) CCDownloadInfo* downloadInfo;//下载信息
@property (nonatomic,retain) UIActivityIndicatorView* activityIndicator;

@property (nonatomic,retain) UIButton* btnStart;//开始按钮
@property (nonatomic,retain) UIButton* btnPause; 
@property (nonatomic,retain) UIButton* btnEnd;
@property (nonatomic,assign) CCDownTableView* btnDelegete;//代理，用于回调CCDownTableView中的 按钮响应方法

@property int  viewIndex;
@property BOOL isSecondView;

- (CCDownloadView*) initWithFrame:(CGRect) aFrame withDownloadInfo:(CCDownloadInfo*) aDownloadInfo;

- (void) setDownloadInfo:(CCDownloadInfo *) aDownloadInfo;

- (void) changeView;


- (BOOL) loadViewQY; 
- (void) dealloc;

@end
