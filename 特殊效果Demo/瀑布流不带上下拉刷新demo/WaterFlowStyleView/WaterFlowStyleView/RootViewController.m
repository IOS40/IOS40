//
//  RootViewController.m
//  WaterFlowStyleView
//
//  Created by 轻舔指尖 on 13-3-29.
//  Copyright (c) 2013年 Taobao. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"推倒瀑布流" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(addbuttonmodel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void) addbuttonmodel
{
    ViewController *viewController = [[ViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES ];
    [self.navigationController setHidesBottomBarWhenPushed:YES];
    NSLog(@"hghgh");
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
