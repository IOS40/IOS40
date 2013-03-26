//
//  MyYeelinkViewController.m
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "MyYeelinkViewController.h"
#import "LoginWebViewController.h"
#import "SensorViewController.h"
#import "DeviceInformation.h"
@interface MyYeelinkViewController ()

@end

@implementation MyYeelinkViewController
@synthesize myYeelinktableView=_myYeelinktableView;
@synthesize enterView=_enterView;
@synthesize logoImageView=_logoImageView;
@synthesize accountNumberTextField=_accountNumberTextField;
@synthesize passWordTextField=_passWordTextField;
@synthesize enterButton=_enterButton;
@synthesize loginButton=_loginButton;
@synthesize deviceArray=_devicArray;
@synthesize indicatorView=_indicatorView;
@synthesize cancleButton=_cancleButton;
@synthesize refreshButton=_refreshButton;
@synthesize finalData=_finalData;


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        _finalData=[[NSMutableData alloc]init];
        _devicArray=[[NSMutableArray alloc]initWithCapacity:10];

    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"出现" object:nil];
    [self.navigationController setToolbarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"我的Yeelink";
    
    _myYeelinktableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,LCDW,LCDH-44-49)];
    _myYeelinktableView.delegate=self;
    _myYeelinktableView.dataSource=self;
    [self.view addSubview:_myYeelinktableView];
    
    _enterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, LCDW, LCDH-44-49+110*LCDH/480.0)];
    [_enterView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_enterView];
    
    UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
    [_enterView addGestureRecognizer:tap];
   
    
    _logoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(100*LCDW/320.0, 50*LCDH/480.0, 120*
                                                                LCDW/320.0, 50*LCDH/480.0)];
    UIImage* image=[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Yeelink_logo_hd" ofType:@"png"]];
    [_logoImageView setImage:image];
    [_enterView addSubview:_logoImageView];
    
    _accountNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(80*LCDW/320.0,150*LCDH/480.0,160*LCDW/320.0,30*LCDH/480.0)];
    [_accountNumberTextField setBorderStyle:UITextBorderStyleRoundedRect];//设置样式
    _accountNumberTextField.placeholder = @"请输入您的账号";
    _accountNumberTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _accountNumberTextField.backgroundColor = [UIColor whiteColor];
    _accountNumberTextField.returnKeyType = UIReturnKeyDone;
    _accountNumberTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _accountNumberTextField.text=@"";
    _accountNumberTextField.delegate = self;
    [_enterView addSubview:_accountNumberTextField];
    
    _passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(80*LCDW/320.0,210*LCDH/480.0,160*LCDW/320.0,30*LCDH/480.0)];
    [_passWordTextField setBorderStyle:UITextBorderStyleRoundedRect];//设置样式
    _passWordTextField.placeholder = @"请输入您的密码";
    _passWordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _passWordTextField.backgroundColor = [UIColor whiteColor];
    _passWordTextField.returnKeyType = UIReturnKeyDone;
    _passWordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passWordTextField.secureTextEntry=YES;
    _passWordTextField.delegate = self;
    _passWordTextField.text=@"";
    [_enterView addSubview:_passWordTextField];
    
    _enterButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_enterButton setFrame:CGRectMake(80*LCDW/320.0, 270*LCDH/480.0, 60*LCDW/320.0, 30*LCDH/480.0)];
    [_enterButton setTitle:@"登入" forState:UIControlStateNormal];
    [_enterButton addTarget:self action:@selector(userEnter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_enterButton];
    
    _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(180*LCDW/320.0, 270*LCDH/480.0, 60*LCDW/320.0, 30*LCDH/480.0)];
    [_loginButton setTitle:@"注册" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(userLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    _indicatorView=[[MyIndicatorView alloc]initWithCenter:CGPointMake(LCDW/2, (LCDH-44-49)/2)];
    [_indicatorView setHidden:YES];
    [self.view addSubview:_indicatorView];
    
    _cancleButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(cancelUserName)];
    _refreshButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshDevice)];
    
    if (([[NSUserDefaults standardUserDefaults] objectForKey:@"username"]!=nil)&& (![[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]isEqualToString:@""]))
    {
        [_enterView setHidden:YES];
        [_enterButton setHidden:YES];
        [_loginButton setHidden:YES];
        [_indicatorView appearWithTitle:@"加载中..."];
        self.navigationItem.leftBarButtonItem=_cancleButton;
        self.navigationItem.rightBarButtonItem=_refreshButton;
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
        
        //异步请求
        NSString *urlString = [NSString stringWithFormat:@"http://www.yeelink.net/mobile/list_devices?login=%@&apikey=%@",
                               [[NSUserDefaults standardUserDefaults] objectForKey:@"username"],
                               [[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        [NSURLConnection connectionWithRequest:request delegate:self];
    }
	// Do any additional setup after loading the view.
}
-(void)tapGesture
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES ];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0, LCDW, LCDH)];
    [UIView commitAnimations];
    [_accountNumberTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
}
-(void)cancelUserName
{
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"当前用户为:%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]] message:@"是否确认注销？" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是" ,nil];
    [alertView show];

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        _accountNumberTextField.text=@"";
        _passWordTextField.text=@"";
        [_enterView setHidden:NO];
        [_enterButton setHidden:NO];
        [_loginButton setHidden:NO];
        self.navigationItem.leftBarButtonItem=nil;
        self.navigationItem.rightBarButtonItem=nil;
        [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"authcode"];
        [[NSUserDefaults standardUserDefaults] setValue:nil  forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:nil  forKey:@"password"];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
        [_devicArray removeAllObjects];
    }
}


-(void)refreshDevice
{
    [_devicArray removeAllObjects];
    //异步请求
    NSString *urlString = [NSString stringWithFormat:@"http://www.yeelink.net/mobile/list_devices?login=%@&apikey=%@",
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"username"],
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    [_indicatorView appearWithTitle:@"加载中..."];
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES ];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.3];
    [self.view setFrame:CGRectMake(0, -110*LCDH/480.0, LCDW, LCDH)];
    [UIView commitAnimations];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if((![_accountNumberTextField isFirstResponder])&&(![_passWordTextField isFirstResponder]))
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES ];
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.2];
        [self.view setFrame:CGRectMake(0, 0, LCDW, LCDH)];
        [UIView commitAnimations];
        [_accountNumberTextField resignFirstResponder];
        [_passWordTextField resignFirstResponder];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES ];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0, LCDW, LCDH)];
    [UIView commitAnimations];
    [_accountNumberTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    return YES;
}
- (void)userEnter:(UIButton*)sender
{
    NSLog(@"1");
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES ];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0, LCDW, LCDH)];
    [UIView commitAnimations];
    [_accountNumberTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    if ([self.accountNumberTextField.text isEqualToString:@""]) {
    [self showError: @"请填写用户名"];
        return ;
    }
    if ([self.passWordTextField.text isEqualToString:@""]) {
        [self showError: @"请填写密码"];
        return;
    }
    [_indicatorView appearWithTitle:@"登陆中..."];
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://www.yeelink.net/mobile/login?login=%@&password=%@", self.accountNumberTextField.text, self.passWordTextField.text];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    NSLog(@"%@",request.HTTPMethod);
    //定义一个http响应
    NSURLResponse* response = nil;
    //发送请求
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSString* requestInfo = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",requestInfo);
    
    if (requestInfo == nil || [requestInfo isEqualToString:@""]) {
        [self performSelectorOnMainThread:@selector(showError:) withObject:@"登录发生错误，请检查您的网络设置" waitUntilDone:YES];
    }
    NSJSONSerialization* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSDictionary* dict = (NSDictionary*)json;
    if (dict == nil)
    {
        [self showError: @"无法解析返回结果"];
        
    }
    if ([[dict valueForKey:@"status"] isEqualToString:@"success"])
    {
        [_enterView setHidden:YES];
        [_enterButton setHidden:YES];
        [_loginButton setHidden:YES];
        [_indicatorView appearWithTitle:@"加载中..."];
        self.navigationItem.leftBarButtonItem=_cancleButton;
        self.navigationItem.rightBarButtonItem=_refreshButton;
        [[NSUserDefaults standardUserDefaults] setValue:[dict valueForKeyPath:@"data.apikey"] forKey:@"authcode"];
        [[NSUserDefaults standardUserDefaults] setValue:self.accountNumberTextField.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setValue:self.passWordTextField.text forKey:@"password"];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
        
        //异步请求
        NSString *urlString = [NSString stringWithFormat:@"http://www.yeelink.net/mobile/list_devices?login=%@&apikey=%@",
                               [[NSUserDefaults standardUserDefaults] objectForKey:@"username"],
                               [[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest* request = [NSURLRequest requestWithURL:url];
        [NSURLConnection connectionWithRequest:request delegate:self];
        
    }
    else if ([[dict valueForKey:@"desc"] isEqualToString:@"Your login or password is now correct"]) {
        [self performSelectorOnMainThread:@selector(showError:) withObject:@"您输入的用户名或者密码错误" waitUntilDone:YES];
        _passWordTextField.text=@"";
       [_indicatorView disAppear];
    }
    else
    {
        [self performSelectorOnMainThread:@selector(showError:) withObject:@"登录返回未知错误" waitUntilDone:YES];
    }
    
   
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
    [_indicatorView disAppear];
    NSArray* array = [dictionary valueForKeyPath:@"data.devices"];
    for (NSDictionary* dict in array)
    {
        DeviceInformation *deviceInformation=[[DeviceInformation alloc]init];
        deviceInformation.deviceId= [dict valueForKey:@"id"];
        deviceInformation.deviceTitle= [dict valueForKey:@"title"];
        deviceInformation.deviceAbout= [dict valueForKey:@"about"];
        
        [_devicArray addObject:deviceInformation];  
    }
    
    [self.myYeelinktableView reloadData];
    
}

- (void)userLogin:(UIButton*)login
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES ];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.2];
    [self.view setFrame:CGRectMake(0, 0, LCDW, LCDH)];
    [UIView commitAnimations];
    [_accountNumberTextField resignFirstResponder];
    [_passWordTextField resignFirstResponder];
    LoginWebViewController* loginWebViewController=[[LoginWebViewController alloc]init];
    [self.navigationController pushViewController:loginWebViewController animated:YES];
}
- (void)showError:(NSString *)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errorMessage delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
    [alert show];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return _devicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    for(UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    if(_devicArray.count!=0)
    {
        cell.textLabel.text=[[_devicArray objectAtIndex:indexPath.row]deviceTitle];
        cell.detailTextLabel.text=[[_devicArray objectAtIndex:indexPath.row]deviceAbout];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SensorViewController *sensorViewController=[[SensorViewController alloc]initWithId:[[_devicArray objectAtIndex:indexPath.row]deviceId ] ];
    [self.navigationController pushViewController:sensorViewController animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
