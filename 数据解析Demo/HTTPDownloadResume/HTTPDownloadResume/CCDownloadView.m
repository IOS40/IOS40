//
//  DownloadView.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCDownloadView.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration 0.7   // 动画持续时间(秒)
#define kButton_Offset 6

@implementation CCDownloadView

@synthesize imgView = _imgView;
@synthesize textName = _textName;
@synthesize textNameTitle = _textNameTitle;
@synthesize textProgressTitle = _textProgressTitle;
@synthesize progressView = _progressView;
@synthesize downloadInfo = _downloadInfo;
@synthesize activityIndicator = _activityIndicator;

@synthesize btnStart = _btnStart;
@synthesize btnPause = _btnPause;
@synthesize btnEnd   = _btnEnd;
@synthesize btnDelegete = _btnDelegete;

@synthesize viewIndex = _viewIndex;
@synthesize isSecondView = _isSecondView;

//初始化DownView 
- (CCDownloadView*) initWithFrame:(CGRect) aFrame withDownloadInfo:(CCDownloadInfo*) aDownloadInfo
{
    if (self = [super initWithFrame:aFrame])
    {
        self.DownloadInfo = aDownloadInfo;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

//加载视图
- (BOOL) loadViewQY
{
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/6, self.frame.size.height)];
    [self.activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [self.activityIndicator startAnimating];
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(2, 0, self.frame.size.width/6, self.frame.size.height)];
    self.imgView.image = self.downloadInfo.imgPreView;
    self.imgView.contentMode = UIViewContentModeScaleAspectFit;
    self.textNameTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/6 + 6, 0, self.frame.size.width/6, self.frame.size.height/2)];
    self.textNameTitle.backgroundColor = [UIColor clearColor];
    self.textNameTitle.text = @"名称：";
    
    self.textProgressTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/6 + 6, self.frame.size.height/2, self.frame.size.width/6, self.frame.size.height/2)];
    self.textProgressTitle.backgroundColor = [UIColor clearColor];
    self.textProgressTitle.text = @"进度：";
    
    self.textName = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/3 + 8, 0, self.frame.size.width/2, self.frame.size.height/2)];
    self.textName.backgroundColor = [UIColor clearColor];
    self.textName.textAlignment = UITextAlignmentCenter;
    [self.textName setFont:[UIFont systemFontOfSize:15]];
    self.textName.text = self.downloadInfo.linkName;
    
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(self.frame.size.width/3 + 0 + 2, self.frame.size.height - 18, self.frame.size.width/2, self.frame.size.height/2)];
    [self.progressView setProgressViewStyle:UIProgressViewStyleDefault];
    
    //加载按键，将来用来开始暂停和取消下载（删除临时文件） 
    self.btnStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnStart.frame = CGRectMake(self.frame.size.width/6 + kButton_Offset, 2, self.frame.size.width/6 - kButton_Offset, self.frame.size.height/3 - 4);
    [self.btnStart setTitle:@"start" forState:UIControlStateNormal];
    [self.btnStart setTag:self.viewIndex];
    [self.btnStart addTarget:self.btnDelegete action:@selector(startDownload:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnPause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnPause.frame = CGRectMake(self.frame.size.width/6 + kButton_Offset, 2 + self.frame.size.height/3, self.frame.size.width/6 - kButton_Offset, self.frame.size.height/3 - 4);
    [self.btnPause setTag:self.viewIndex];
    [self.btnPause setTitle:@"pause" forState:UIControlStateNormal];
    [self.btnPause addTarget:self.btnDelegete action:@selector(pauseDownload:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnEnd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btnEnd.frame = CGRectMake(self.frame.size.width/6 + kButton_Offset, 2 + self.frame.size.height/3*2, self.frame.size.width/6 - kButton_Offset, self.frame.size.height/3 - 4);
    [self.btnEnd setTag:self.viewIndex];
    [self.btnEnd setTitle:@"end" forState:UIControlStateNormal];
    [self.btnEnd addTarget:self.btnDelegete action:@selector(endDownload:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_imgView];
    [self addSubview:_textName];
    [self addSubview:_textNameTitle];
    [self addSubview:_textProgressTitle];
    [self addSubview:_progressView];
    
    [self addSubview:self.btnStart];
    [self addSubview:self.btnPause];
    [self addSubview:self.btnEnd];
    
    [_btnEnd setHidden:YES];
    [_btnStart setHidden:YES];
    [_btnPause setHidden:YES];
    
    return  YES;
}

//动画结束后切花第二视图（隐藏按键）
- (void)changeView
{
//    self.isSecondView = !self.isSecondView;
//    if (self.isSecondView)
//    {
//        [_textProgressTitle setHidden:YES];
//        [_textNameTitle setHidden:YES];
//        
//        [_btnEnd setHidden:NO];
//        [_btnStart setHidden:NO];
//        [_btnPause setHidden:NO];
//    }
//    else
//    {
//        [_textProgressTitle setHidden:NO];
//        [_textNameTitle setHidden:NO];
//        
//        [_btnEnd setHidden:YES];
//        [_btnStart setHidden:YES];
//        [_btnPause setHidden:YES];
//    }
}
//修改视图布局
- (void)layoutSubviews
{
    self.isSecondView = !self.isSecondView;
    if (self.isSecondView)
    {
        [_textProgressTitle setHidden:YES];
        [_textNameTitle setHidden:YES];
        
        [_btnEnd setHidden:NO];
        [_btnStart setHidden:NO];
        [_btnPause setHidden:NO];
    }
    else
    {
        [_textProgressTitle setHidden:NO];
        [_textNameTitle setHidden:NO];
        
        [_btnEnd setHidden:YES];
        [_btnStart setHidden:YES];
        [_btnPause setHidden:YES];
    }
}

- (void) dealloc
{
    [_imgView release];
    [_textProgressTitle release];
    [_textNameTitle release];
    [_textName release];
    [_progressView release];
    [_downloadInfo release];
    [_activityIndicator release];
    
    [_btnEnd release];
    [_btnStart release];
    [_btnPause release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
