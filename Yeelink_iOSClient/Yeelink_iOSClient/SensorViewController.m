//
//  SensorViewController.m
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-21.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "SensorViewController.h"
#import "SensorInformation.h"
#import "DataViewController.h"
#import "ImageViewController.h"
#import "GPSViewController.h"
#import "SwitchIndicatorView.h"

@interface SensorViewController ()

@end

@implementation SensorViewController
@synthesize  sensorArray=_sensorArray;
@synthesize finalData=_finalData;
@synthesize deviceId=_deviceId;
@synthesize tableView=_tableView;

- (id)initWithId:(NSString*)aId
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        _sensorArray=[[NSMutableArray alloc]initWithCapacity:10];
        _finalData=[[NSMutableData alloc]init];
        _deviceId=aId;
        NSLog(@"%@",_deviceId);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"传感器";
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
    _indicatorView=[[MyIndicatorView alloc]initWithCenter:CGPointMake(LCDW/2, (LCDH-44-49)/2)];
    [_indicatorView setHidden:YES];
    [self.view addSubview:_indicatorView];
    //异步请求
    NSString *urlString = [NSString stringWithFormat:@"http://www.yeelink.net/mobile/list_sensors?login=%@&apikey=%@&device=%@",
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"username"],
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"],
                           _deviceId];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    [_indicatorView appearWithTitle:@"加载中..."];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* responses = (NSHTTPURLResponse*)response;
    NSLog(@"%d",[responses statusCode]);
    _finalData=[[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_finalData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@",[[NSString alloc] initWithData:_finalData encoding:NSUTF8StringEncoding]);
    NSJSONSerialization* json = [NSJSONSerialization JSONObjectWithData:_finalData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary* dictionary = (NSDictionary*)json;
    if (dictionary == nil)
    {
        [self showError: @"无法解析返回结果"];
        
    }
    else
    {
        NSArray* array = [dictionary valueForKeyPath:@"data.sensors"];
        for (NSDictionary* dict in array)
        {
            SensorInformation *sensorInformation=[[SensorInformation alloc]init];
            sensorInformation.sensorId= [dict valueForKey:@"id"];
            sensorInformation.sensorType= [dict valueForKey:@"sensor_type"];
            sensorInformation.sensorAbout= [dict valueForKey:@"about"];
            sensorInformation.sensorLastData=[dict valueForKey:@"last_data"];
            sensorInformation.sensorTitle=[dict valueForKey:@"title"];
            
            [_sensorArray addObject:sensorInformation];
            
        }
        
        [self.tableView reloadData];
    }
     [_indicatorView disAppear];
    
}
- (void)showError:(NSString *)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errorMessage delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
    [alert show];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return _sensorArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if((_sensorArray.count!=0)&&([[[_sensorArray objectAtIndex:indexPath.row]sensorType]intValue]!=5))
        {
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }
    }
    for(UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    if(_sensorArray.count!=0)
    {
        cell.textLabel.text=[[_sensorArray objectAtIndex:indexPath.row]sensorTitle];
        if([[[_sensorArray objectAtIndex:indexPath.row]sensorType]intValue]==5 )
        {
            if([[[_sensorArray objectAtIndex:indexPath.row]sensorLastData]intValue]==1)
            {
                SwitchIndicatorView *dataSwitch=[[SwitchIndicatorView alloc]initWithFrame:CGRectMake(0, 0, LCDW,44 ) andState:YES andDeviceID:_deviceId andSensorID:[[_sensorArray objectAtIndex:indexPath.row]sensorId]];
                [cell.contentView addSubview:dataSwitch];
            }
            else
            {
                SwitchIndicatorView *dataSwitch=[[SwitchIndicatorView alloc]initWithFrame:CGRectMake(0, 0, LCDW,44 ) andState:NO andDeviceID:_deviceId andSensorID:[[_sensorArray objectAtIndex:indexPath.row]sensorId]];
                [cell.contentView addSubview:dataSwitch];
            }
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[[_sensorArray objectAtIndex:indexPath.row]sensorType]intValue] ==0)
    {
        DataViewController* dataViewController=[[DataViewController alloc]initWithTitle:[[_sensorArray objectAtIndex:indexPath.row] sensorTitle] andSensorId:[[_sensorArray objectAtIndex:indexPath.row] sensorId]];
        [self.navigationController pushViewController:dataViewController animated:YES];
    }
    else if([[[_sensorArray objectAtIndex:indexPath.row]sensorType]intValue] ==6)
    {
        GPSViewController* dataViewController=[[GPSViewController alloc]initWithTitle:[[_sensorArray objectAtIndex:indexPath.row] sensorTitle] andSensorId:[[_sensorArray objectAtIndex:indexPath.row] sensorId] andDeviceId:_deviceId];
        [self.navigationController pushViewController:dataViewController animated:YES];
    }
    else if([[[_sensorArray objectAtIndex:indexPath.row]sensorType]intValue] ==9)
    {
        ImageViewController* dataViewController=[[ImageViewController alloc]init];
        [self.navigationController pushViewController:dataViewController animated:YES];
    }
    //    ViewController*v=[[ViewController alloc]init];
    //    [self.navigationController pushViewController:v animated:YES];
    
}

@end
