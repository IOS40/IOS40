//
//  ViewController.m
//  ASIHttpRequestDemo
//
//  Created by Ibokan on 12-12-27.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"
#import "ASIFormDataRequest.h"

#import "ASIHTTPRequest/ASIHTTPRequest.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize sendAsynRquestButton = _sendAsynRquestButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addButton];
}

- (void) addButton
{
    _sendAsynRquestButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, 100)];
    
    [self.sendAsynRquestButton setTitle:@"发送异步请求" forState:UIControlStateNormal];
    [self.sendAsynRquestButton addTarget:self action:@selector(grabURLInBackground:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.sendAsynRquestButton];
}


- (void) grabURLInBackground:(id) sender
{
    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt:1],
                                   @"size",
                                   [NSNumber numberWithInt:0],
                                   @"sinceId",
                                   nil];

    NSString* apiPath = @"/star/statuses/timeline/verified.json";

    NSString* urlString = [[self class] serializeURL:[NSString stringWithFormat:@"http://sapi.yinyuetai.com%@", apiPath] params:params];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request addRequestHeader:@"App-Id" value:[NSString stringWithFormat:@"%@", @"10121001"]];
    [request addRequestHeader:@"Device-Id" value:@"f36671dd2cc4e3f0f5d6356b0c54febd"];//openUDID
    [request addRequestHeader:@"Device-V" value:@"aVBob25lIE9TXzYuMS4zXzY0MCo5NjBfamF5"];
    [request addBasicAuthenticationHeaderWithUsername:@"10121" andPassword:@"3636161387694e8181dde0609be9963c"];
    
    [request setDelegate:self];
    [request startAsynchronous];
}
- (IBAction)clickLogIn:(id)sender {
    
    [self requestLogin:self.userNameTextField.text AndPassword:self.passwordTextField.text];
    
//    NSMutableDictionary* params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                   [NSNumber numberWithInt:1],
//                                   @"size",
//                                   [NSNumber numberWithInt:0],
//                                   @"sinceId",
//                                   nil];
//    
//    NSString* apiPath = @"/star/statuses/timeline/verified.json";
//    
//    NSString* urlString = [[self class] serializeURL:[NSString stringWithFormat:@"http://sapi.yinyuetai.com%@", apiPath] params:params];
//    
//    NSString *accessToken = nil;
//    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
//    
//    [request addRequestHeader:@"App-Id" value:[NSString stringWithFormat:@"%@", @"10121001"]];
//    [request addRequestHeader:@"Device-Id" value:@"f36671dd2cc4e3f0f5d6356b0c54febd"];//openUDID
//    [request addRequestHeader:@"Device-V" value:@"aVBob25lIE9TXzYuMS4zXzY0MCo5NjBfamF5"];
//    [request addRequestHeader:@"authorization" value:[NSString stringWithFormat:@"Bearer %@",accessToken]];
//    
//    [request setDelegate:self];
//    [request startAsynchronous];
}

- (void)requestLogin:(NSString*)uname AndPassword:(NSString *)password
{
        
    NSString* apiPath = @"http://sapi.yinyuetai.com/account/login.json";
        
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:apiPath]];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:uname,@"username",password,@"password", nil];
    
    [params enumerateKeysAndObjectsUsingBlock:
     ^(id key, id value, BOOL *stop) {
         
         [(ASIFormDataRequest*)request setPostValue:value forKey:key];
     }];
    
    
    [request addRequestHeader:@"App-Id" value:[NSString stringWithFormat:@"%@", @"10121001"]];
    [request addRequestHeader:@"Device-Id" value:@"f36671dd2cc4e3f0f5d6356b0c54febd"];//openUDID
    [request addRequestHeader:@"Device-V" value:@"aVBob25lIE9TXzYuMS4zXzY0MCo5NjBfamF5"];
    [request addBasicAuthenticationHeaderWithUsername:@"10121" andPassword:@"3636161387694e8181dde0609be9963c"];
    
    [request setDelegate:self];
    [request startAsynchronous];

}


+ (NSString*)serializeURL:(NSString *)baseUrl params:(NSDictionary *)params
{
    // URL字符串处理
    
    NSURL* parsedURL = [NSURL URLWithString:baseUrl];
    NSString* queryPrefix = parsedURL.query ? @"&" : @"?";
    
    NSMutableArray* pairs = [NSMutableArray array];
    for (NSString* key in [params keyEnumerator]) {
        if (([[params objectForKey:key] isKindOfClass:[UIImage class]])
            ||([[params objectForKey:key] isKindOfClass:[NSData class]]))
        {
            continue;
        }
        NSString* paramStr = [[NSString stringWithFormat:@"%@", [params objectForKey:key]] retain];
        NSString* escaped_value = (NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                      NULL, /* allocator */
                                                                                      (CFStringRef)paramStr,
                                                                                      NULL, /* charactersToLeaveUnescaped */
                                                                                      (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                      kCFStringEncodingUTF8);
        
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escaped_value]];
        [escaped_value release];
        [paramStr release];
    }
    NSString* query = [pairs componentsJoinedByString:@"&"];
    
    return [NSString stringWithFormat:@"%@%@%@", baseUrl, queryPrefix, query];
}


//请求成功时调用此方法
- (void) requestFinished:(ASIHTTPRequest *)request
{
    NSData *data = [request responseData];
    
    NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSDictionary *dictionary = (NSDictionary*) json;
    NSLog(@"----------:%@", dictionary);

    NSString *token = [dictionary valueForKeyPath:@"access_token"];
    
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] synchronize];

//    for (NSDictionary *dict in array)
//    {
//        NSString *title = [dict valueForKey:@"audioDuration"];
//        NSLog(@"%@",title);
//        
//        NSString *picUrl = [dict valueForKey:@"audioUrl"];
//        NSLog(@"%@",picUrl);
//    }
    
//    NSString *responseString = [request responseString];
//    NSInteger responseStatusCode = [request responseStatusCode];
//    NSLog(@"==%@",responseString);
//    NSLog(@"++%d",responseStatusCode);
}

//请求失败时调用此方法
- (void) requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"-_-%@",error);
}

- (void)viewDidUnload
{
    [self setUserNameTextField:nil];
    [self setPasswordTextField:nil];
    [self setLogInBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [_userNameTextField release];
    [_passwordTextField release];
    [_logInBtn release];
    [super dealloc];
}
@end
