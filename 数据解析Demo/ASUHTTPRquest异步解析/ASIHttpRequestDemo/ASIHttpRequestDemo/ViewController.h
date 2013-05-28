//
//  ViewController.h
//  ASIHttpRequestDemo
//
//  Created by Ibokan on 12-12-27.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIHTTPRequest/ASIHTTPRequest.h"

@interface ViewController : UIViewController<ASIHTTPRequestDelegate>

{
    UIButton *_sendAsynRquestButton;
@private
    ASIHTTPRequest* _request;
}

@property (strong, nonatomic) UIButton *sendAsynRquestButton;
@property (retain, nonatomic) IBOutlet UITextField *userNameTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UIButton *logInBtn;

@end
