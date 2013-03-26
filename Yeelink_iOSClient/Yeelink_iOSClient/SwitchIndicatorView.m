//
//  SwitchIndicatorView.m
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-21.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "SwitchIndicatorView.h"
#import "SBJson.h"
@implementation SwitchIndicatorView
@synthesize indicatorView=_indicatorView;
@synthesize dataSwitch=_dataSwitch;

- (id)initWithFrame:(CGRect)frame andState:(BOOL)aState andDeviceID:(NSString *)aDeviceId andSensorID:(NSString *)aSensorId
{
    self = [super initWithFrame:frame];
    if (self) {
        _switchState=aState;
        _deviceId=aDeviceId;
        _sensorId=aSensorId;
        _dataSwitch=[[UISwitch alloc]init];
        _dataSwitch.frame=CGRectMake(225,8,40,10);
        _dataSwitch.on=aState;
        [_dataSwitch addTarget:self action:@selector(changeState) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_dataSwitch];
        
        _indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _indicatorView.frame=CGRectMake(250,7,30,30);
        [self addSubview:_indicatorView];    
    }
    return self;
}
-(void)changeState
{
    [_dataSwitch setHidden:YES];
    [_indicatorView startAnimating];
    [self asynPostRequest];
}
- (void)asynPostRequest
{
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.yeelink.net/v1.0/device/%@/sensor/%@/datapoints",_deviceId,_sensorId]]];
    request.HTTPMethod = @"POST";
    [request setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"] forHTTPHeaderField:@"U-ApiKey"];
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"]);
    NSDictionary *switchDic = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:(_dataSwitch.isOn?1:0)] forKey:@"value"];
    NSData *jsonData = [[switchDic JSONRepresentation] dataUsingEncoding:NSUTF8StringEncoding];

    [request setHTTPBody:jsonData];
    [request addValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _responses = (NSHTTPURLResponse*)response;
    if([_responses statusCode]==200)
    {
        if(_switchState==YES)
        {
            _switchState=NO;
            _dataSwitch.on=NO;
        }
        else
        {
            _switchState=YES;
            _dataSwitch.on=YES;
        }
    }
    else
    {
        [self showError:@"开关设置失败"];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_finalData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [_indicatorView stopAnimating];
    [_dataSwitch setHidden:NO];
}
- (void)showError:(NSString *)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errorMessage delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
    [alert show];
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
