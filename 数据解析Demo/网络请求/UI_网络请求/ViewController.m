//
//  ViewController.m
//  UI_网络请求
//
//  Created by Ibokan on 12-11-19.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"
#import "GDataXMLNode.h"
#import "JSON.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_dataArray = [[NSMutableData alloc]init];
    _imageArray = [[NSMutableArray alloc] initWithCapacity:10];
//    [self syncGetRequest];
//    [self syncPostRequest];
    [self asynGetRequest];
//    [self asynPostRequest];
}
#pragma mark - sync GET
-(void)syncGetRequest
{
    //定义一个http请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.tudou.com/v3/gw?method=item.ranking&appKey=myKey&format=xml&pageNo=1&pageSize=10&channelId=22&inDays=7&sort=c"]];
    request.HTTPMethod = @"GET";
    //定义一个http响应
    NSURLResponse *response = nil;
    //发送请求
    NSData *data = [NSURLConnection sendSynchronousRequest/*发送同步请求*/:request returningResponse:&response error:nil];
    NSString *requestInfo  = [[NSString alloc] initWithData:data encoding/*编码类型*/:NSUTF8StringEncoding];//请求信息
    NSLog(@"%@",requestInfo);
}
#pragma mark - sync POST
-(void)syncPostRequest
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tm.mbpay.cn:8082"]];
    request.HTTPMethod = @"POST";
    
    request.HTTPBody = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"request" ofType:@"xml"]];
    
    NSURLResponse *response = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString *requestInfo = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestInfo);
 }
#pragma mark - asyn GET
-(void)asynGetRequest
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.tudou.com/v3/gw?method=item.ranking&appKey=myKey&format=json&pageNo=1&pageSize=10&channelId=22&inDays=7&sort=c"]];
    //建立网络连接 并设其代理
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark - asyn POST
-(void)asynPostRequest
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://tm.mbpay.cn:8082"]];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"request" ofType:@"xml"]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - asyn methods
//接受到服务器回应的时候调用此方法
-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *responses = (NSHTTPURLResponse*)response;
    NSLog(@"%d",[responses statusCode/*状态代码*/]);
    NSLog(@"%lld",[responses expectedContentLength]);
}
//接收到服务器传输数据的时候调用，此方法根据数据大小会执行若干次
-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_dataArray appendData:data];
}


//数据传完之后调用此方法
-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
//    /*XML解析*/
//    GDataXMLDocument *document/*文件*/ = [[GDataXMLDocument alloc] initWithData:_dataArray options:0 error:nil];//初始化一个XML文件
//    if(document35)
//    {
//        NSArray *nodes/*节点*/ = [document nodesForXPath:@"//body//rows//wp_film" error:nil];//初始化节点的数组（路径为post的路径）
//        for (GDataXMLElement/*XML节点元素*/ *item in nodes)//遍历节点数组 存进 XML节点元素里
//        {
//            //解析字符串
////            NSString *title = [[[item elementsForName:@"title"] objectAtIndex:0] stringValue];//GET用的解析
//            NSString *title = [[item attributeForName:@"director"]  stringValue];//POST用的解析 director为key
//            NSLog(@"%@",title);
//            
//            //解析图片
//            NSString *picUrl = [[[item elementsForName:@"thumbnail"] objectAtIndex:0] stringValue];
//            NSData *data = [[NSData alloc] initWithContentsOfFile:[NSURL URLWithString:picUrl]];
//            UIImage *image = [UIImage imageWithData:data];
//            [_imageArray addObject:image];
//        }
//    }
    
    /*JSON解析*/
//    //系统自带JSON解析
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:_dataArray options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dictionary = (NSDictionary*) json;//把json 返回的数据强转为字典
    
//    //SBJSON解析
//    NSString *json = [[NSString alloc] initWithData:_dataArray encoding:NSUTF8StringEncoding];
//    NSDictionary *dictionary = (NSDictionary*)[json JSONValue];
    
    NSArray *array = [dictionary valueForKeyPath:@"multiPageResult.results"];//找到字典中的数组
    for (NSDictionary *dict in array)//遍历数组 出来的是字典
    {
        //解析字符串
        NSString *title = [dict valueForKey:@"title"];//根据字典的key找到内容
        NSLog(@"名字：%@",title);
        //解析图片
        NSString *picUrl = [dict valueForKey:@"picUrl"];
        NSLog(@"图片：%@",picUrl);
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:picUrl]];
        UIImage *image = [UIImage imageWithData:data];
        [_imageArray addObject:image];
    }
    
    NSString *requestInfo = [[NSString alloc] initWithData:_dataArray encoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestInfo);
    [requestInfo release];
}



//网络请求过程中，出现任何错误（断网，连接超时等...）会进入此方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"========%@",[error localizedDescription]);
}

#pragma mark - did
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
