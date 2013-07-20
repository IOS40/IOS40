//
//  DownTableView.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCDownTableView.h"
#import "CCDownloadInfo.h"
#import "CCDownloadView.h"
#import "CCASIHTTPRequest.h"
#import <QuartzCore/QuartzCore.h>

#define kDuration 0.7   // 动画持续时间(秒)



@implementation CCDownTableView

@synthesize tableArray = _tableArray;
@synthesize viewArray = _viewArray;
@synthesize requestQueue = _requestQueue;
@synthesize totalProgressView = _totalProgressView;

@synthesize bFail = _bFail;

- (CCDownTableView*) initWithArray:(NSArray*) aArray
{
    if (self = [super init])
    {
        self.frame = [[UIScreen mainScreen] bounds];
        //初始化tableArray；
        self.tableArray = [[NSMutableArray alloc] init];
        [self.tableArray addObjectsFromArray:aArray];
        //设置代理及
        [self setDataSource:self];
		[self setDelegate:self];
        //设置cell高度
        [self setRowHeight:60];
        //初始化视图队列
        self.viewArray = [[NSMutableArray alloc] init];
        //初始化HTTP请求队列
        self.requestQueue = [[NSMutableArray alloc] init];
        //初次建立链接
        [self buildConnecting];
    }
    return self;
}

- (void)buildConnecting
{
    for (int i = 0; i < _tableArray.count; i++)
    {
        CCDownloadInfo* infoCell = [self.tableArray objectAtIndex:i];
        //初始化下载视图并且加到视图数组中
        CCDownloadView* view = [[CCDownloadView alloc] initWithFrame:CGRectMake(0, 0, 320, self.rowHeight)];
        //同个infoCell设置下载是需要的信息，比如说链接 下载进度等等
        [view setDownloadInfo:infoCell];
        //设置视图中按键回调的代理
        [view setBtnDelegete:self];  
        //设置当前视图所在的索引（很总要）
        [view setViewIndex:i];    
        //加载视图
        [view loadViewQY];      
        if (0 == i)
        {
//            [view setExclusiveTouch:YES];
            [view.btnStart setExclusiveTouch:YES];
        }
        [self.viewArray addObject:view];
        
        //初始化HTTP请求 并加到网络请求数组中
        //通过链接url创建request请求
        CCASIHTTPRequest* request = [CCASIHTTPRequest requestWithURL:infoCell.url];
        //设置下载文件的信息（下载文件路径，以及遇到重名问题的处理）
        [request setDownloadFileInfo];
        //设置预览图片更换的代理
        [request setImgDelegete:self];
        //设置HTTP请求索引
        [request setRequestIndex:i];
        //根据view中的UIProgressView 为request设置进度代理
        [request setDownloadProgressDelegate:view.progressView];
        //将HTTP请求加载到队列中去
        [self.requestQueue addObject:request];
        //这里需要重新更改一下名字，因为可能涉及到重名问题，所以需要在这里更新一下解析的新名字。
        [[view textName] setText:[[request downloadDestinationPath] lastPathComponent]];
        [view release];
    }
}

//重新建立连接
- (void) reConnecting:(int) aIndex
{
    //获取请求队列中在aIndex索引上的请求
    CCASIHTTPRequest* tmp = [self.requestQueue objectAtIndex:aIndex];
    //获取视图信息
    CCDownloadInfo* infoCell = [self.tableArray objectAtIndex:aIndex];
    //新建http请求
    CCASIHTTPRequest* request = [CCASIHTTPRequest requestWithURL:infoCell.url];
    //设置下载文件的信息（下载文件路径，以及遇到重名问题的处理）
    [request setDownloadFileInfo];
    //设置预览图片更换的代理
    [request setImgDelegete:self];
    //设置HTTP请求索引
    [request setRequestIndex:aIndex];
    //根据view中的UIProgressView 为request设置进度代理
    [request setDownloadProgressDelegate:[[self.viewArray objectAtIndex:aIndex] progressView]];
    //替换原队列中的请求
    [self.requestQueue replaceObjectAtIndex:aIndex withObject:request];
    //开始异步请求
    [request startAsynchronous];
    //释放原队列中的请求
    [tmp release];
}

//完成下载后更换图片
- (void) didFinishdownload:(NSString*) aFilePath viewIndex:(int) aViewIndex
{
    //获取视图指针
    CCDownloadView* view = [self.viewArray objectAtIndex:aViewIndex];
    //释放掉原图片
    [view.imgView.image release];
    //加载新图片
    [view.imgView setImage:[UIImage imageWithContentsOfFile:aFilePath]];
}

//下载时出错(这里只处理的一种，具体看 ASHHTTPRequest.h)
- (void) didDownloadError:(ASIHTTPRequest*) aRequest
{
    NSError *err = [aRequest error];
    if (err.code == 1)//只做了一种无连接情况
    {
        UIAlertView* albert = [[UIAlertView alloc] initWithTitle:@"警告！！！" message:@"无连接，请检查网络" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        albert.frame = CGRectMake(20, (480 - 160) / 2, 280, 160);
        albert.alertViewStyle = UIAlertViewStyleDefault;
        [self addSubview:albert];
        [albert show];
        [albert release];
        self.bFail = YES;
    }
}


- (void) dealloc
{
    [_tableArray release];
    [_viewArray release];
    [_requestQueue release];
    [super dealloc];
}

//设置TableView数组
- (void) setDownloadArray:(NSArray*) aArray
{
    [self.tableArray removeAllObjects];
    [self.tableArray addObjectsFromArray:aArray];
    [self buildConnecting];
}

#pragma mark - protocol<UITableViewDelegate,UITableViewDataSource>
//TableView的几个回调函数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [self.tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString* aTableView = @"downloadTableIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:aTableView];
    //如果这个cell为空的话则创建
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:aTableView] autorelease];
    }
    //清除这一个cell上的所有view
    for(CCDownloadView* view in cell.contentView.subviews)
	{
		[view removeFromSuperview];
	}
    //重用这个视图
    [cell.contentView addSubview:[self.viewArray objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void) tableView:(UITableView*) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO];

    // 创建CATransition对象
    CATransition* animation = [CATransition animation];
    //设置动画代理
    animation.delegate = self;
    // 设定动画时间
    animation.duration = kDuration;
    // 设定动画快慢(开始与结束时较慢)
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //甚至动画类型
    animation.type = @"cube";
    //动画方向
    animation.subtype = ![[self.viewArray objectAtIndex:indexPath.row] isSecondView]?kCATransitionFromTop:kCATransitionFromBottom;
    // 视图切换
//    [[self.viewArray objectAtIndex:indexPath.row] changeView];
    [[self.viewArray objectAtIndex:indexPath.row] setNeedsLayout];
    // 动画开始
    [[[self.viewArray objectAtIndex:indexPath.row] layer] addAnimation:animation forKey:@"animation"];
    
}

#pragma mark downloadViewProtrol
//开始下载
- (void)startDownload:(id) sender
{
    UIButton* button = (UIButton*)sender;
    NSInteger tag = button.tag;
    
    CCASIHTTPRequest* tmp = [self.requestQueue objectAtIndex:tag];
//    NSLog(@"%@",[tmp requestID]);
    NSLog(@"%d",[tmp isCancelled]);
    if ([tmp isCancelled])//判断链接是否已经取消
    {
        [self reConnecting:tag];
    }
    else
    {
        if (![tmp isExecuting])//判断连接是否正在进行
        {
            if (self.bFail)//是否失败过重新建立
            {
                [self reConnecting:tag];
            }
            else
            {
                [tmp startAsynchronous];
            }
        }
    }
    
}
//暂停下载
- (void)pauseDownload:(id) sender
{
    UIButton* button = (UIButton*)sender;
    NSInteger tag = button.tag;
    CCASIHTTPRequest* tmp = [self.requestQueue objectAtIndex:tag];
    [tmp cancel];//取消下载
    
}
//取消下载
- (void)endDownload:(id) sender
{
    UIButton* button = (UIButton*)sender;
    NSInteger tag = button.tag;
    
    NSString* filePath = [[self.requestQueue objectAtIndex:tag] temporaryFileDownloadPath];
    NSFileManager* manager = [NSFileManager defaultManager];
    //获取连接
    CCASIHTTPRequest* tmp = [self.requestQueue objectAtIndex:tag];
    //将进度条置零
    [[[self.viewArray objectAtIndex:tag] progressView] setProgress:0];
    //删除临时文件
    if ([manager isDeletableFileAtPath:filePath])//先判断源文件可不可以删除（这是习惯问题）
    {
        [manager removeItemAtPath:filePath error:nil];
    }
    else
    {
        //可以添加一个UIALbertView 来提示一下
    }
    //取消下载
    [tmp cancel];
}

- (void)setProgress:(float)newProgress
{
    NSLog(@"%f",newProgress);
}


@end
