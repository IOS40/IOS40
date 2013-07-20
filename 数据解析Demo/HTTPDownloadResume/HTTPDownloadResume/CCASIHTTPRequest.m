//
//  CCASIHTTPRequest.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCASIHTTPRequest.h"

@implementation CCASIHTTPRequest

@synthesize imgDelegete = _imgDelegete;
@synthesize requestIndex = _requestIndex;

- (void)setDownloadFileInfo
{
    //设置下载文件存储路径
    NSString* destinationPath = [self procFilePath];
    [self setDownloadDestinationPath:destinationPath];
    //设置临时文件目录（添加.download 后缀名）
    [self setTemporaryFileDownloadPath:[destinationPath stringByAppendingPathExtension:@"download"]];
    //设置请求的回调代理 在结束或者出错时的回调代理
    [self setDelegate:self];
    //设置允许断点续传
    [self setAllowResumeForFileDownloads:YES];
    //重置progress
    self.shouldResetDownloadProgress = YES;
}
//处理下载文件重名问题
- (NSString*)procFilePath
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* lastName = [self.url lastPathComponent];
    NSString* fileName = [lastName stringByDeletingPathExtension];
    NSString* extName = [lastName pathExtension];
    NSString* filePath = nil;
    
    for (int i = 0; ; i++)
    {
        NSString* tmp = nil;
        if(i != 0)
        {
            tmp = [NSString stringWithFormat:@"%@%@%d%@",fileName,@"(",i,@")"];   
        }
        else
        {
            tmp = [NSString stringWithFormat:fileName];
        }

        filePath = [[[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:tmp] stringByAppendingPathExtension:extName];
        if ([fileManager fileExistsAtPath:filePath])
        {
            continue;
        }
        else
        {
            return filePath;//返回改名后的路径
        }
    }
}

//这个回调主要是获取HTTPHeader 响应  获取文件大小就是从这里
- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)aResponseHeaders
{

}
//下载完成
- (void)requestFinished:(ASIHTTPRequest *)aRequest
{
    [self.imgDelegete didFinishdownload:self.downloadDestinationPath viewIndex:self.requestIndex];
}
//下载出错，错误码自己看列表
- (void)requestFailed:(ASIHTTPRequest *)aRequest
{   
    [self.imgDelegete didDownloadError:aRequest];
}

@end
