//
//  DownloadInfo.h
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCDownloadInfo : NSObject

@property (nonatomic,retain) NSString* linkName;//需要下载文件的名字 
@property (nonatomic,retain) NSURL* url; //需要下载文件的链接
@property (nonatomic,retain) UIImage* imgPreView;//在下载未完成时显示的预览图片（本地读取）
@property (nonatomic,retain) NSString* totalByteByRead;
@property (nonatomic,retain) NSString* contentLength;

+(CCDownloadInfo*) downinfoWithUrl:(NSURL*) aUrl withLinkName:(NSString*) aName;
-(CCDownloadInfo*) initWithUrl:(NSURL*) aUrl withLinkName:(NSString*) aName;

-(void) dealloc;

@end
