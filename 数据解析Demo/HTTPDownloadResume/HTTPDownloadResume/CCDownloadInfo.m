//
//  DownloadInfo.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCDownloadInfo.h"

@implementation CCDownloadInfo

@synthesize linkName = _linkName;
@synthesize url = _url;
@synthesize imgPreView = _imgPreView;
@synthesize contentLength = _contentLength;
@synthesize totalByteByRead = _totalByteByRead;

+(CCDownloadInfo*) downinfoWithUrl:(NSURL*) aUrl withLinkName:(NSString*) aName
{
    CCDownloadInfo* pRet = [[CCDownloadInfo alloc] initWithUrl:aUrl withLinkName:aName];
    return [pRet autorelease];
}
-(CCDownloadInfo*) initWithUrl:(NSURL*) aUrl withLinkName:(NSString*) aName
{
    if (self = [super init])
    {
        self.url = aUrl;
        self.linkName = aName;
        NSString* imgPath = [[NSBundle mainBundle] pathForResource:@"25" ofType:@"png"];
        _imgPreView = [[UIImage alloc] initWithContentsOfFile:imgPath];
    }
    
    return self;
}

-(void) dealloc
{
    [_url release];
    [_linkName release];
    [_imgPreView release];
    [_contentLength release];
    [_totalByteByRead release];
    [super dealloc];
}

@end
