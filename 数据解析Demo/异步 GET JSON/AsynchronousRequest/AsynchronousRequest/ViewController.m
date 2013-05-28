//
//  ViewController.m
//  AsynchronousRequest
//
//  Created by Ibokan on 12-12-26.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize titleArray = _titleArray;

@synthesize imageArray = _imageArray;

@synthesize receiveData = _receiveData;

@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _imageArray = [[NSMutableArray alloc] initWithCapacity:10];
    _titleArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    [self asynGetJson];
    [self addTableView];
}

#pragma mark - 异步 GET JSON 解析

- (void) asynGetJson
{
    //第一步，创建url
    NSURL *url = [NSURL URLWithString:@"http://api.tudou.com/v3/gw?method=item.ranking&appKey=myKey&format=json&pageNo=1&pageSize=10&channelId=0&inDays=3&sort=v"];
    
    //第二步，创建请求
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    //第三步，连接服务器
    [NSURLConnection connectionWithRequest:request delegate:self];
}

//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    
    NSLog(@"%d",[res statusCode]);
    
    if ([res statusCode] == 403)
    {
        [self performSelector:@selector(asynGetJson) withObject:nil afterDelay:2.0];
    }
    
    self.receiveData = [NSMutableData data];
}

//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}

//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:self.receiveData options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *dictionary = (NSDictionary*) json;
    
    NSArray *array = [dictionary valueForKeyPath:@"multiPageResult.results"];
    
    for (NSDictionary *dict in array)
    {
        NSString *title = [dict valueForKey:@"title"];
        NSLog(@"%@",title);
        
        NSString *picUrl = [dict valueForKey:@"picUrl"];
        NSLog(@"%@",picUrl);
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:picUrl]];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        [self.titleArray addObject:title];
        [self.imageArray addObject:image];
    }
//    NSLog(@"%d %d",self.titleArray.count,self.imageArray.count);
//    NSString *receiveStr = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
//    NSLog(@"%@",receiveStr);
    [self.tableView reloadData];
    
}

//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error

{
    NSLog(@"%@",[error localizedDescription]);
}

#pragma mark - 添加TableView

- (void) addTableView
{
    NSLog(@"1111");
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.imageArray.count;
    NSLog(@"%d",self.imageArray.count);
    
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return cell;
}

- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    cell.imageView.image = [self.imageArray objectAtIndex:indexPath.row];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
