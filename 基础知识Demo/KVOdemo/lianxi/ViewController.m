//
//  ViewController.m
//  lianxi
//
//  Created by Lucifer on 13-4-3.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "ViewController.h"
#import "StockData.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize myLabel = _myLabel;
- (void) dealloc
{
    self.myLabel = nil;
    [[StockData stocData] removeObserver:self forKeyPath:@"price" context:nil];
    [[StockData stocData] release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    [[StockData stocData] setValue:@"apple" forKey:@"stockName"];
    [[StockData stocData] setValue:@"10.0" forKey:@"price"];
    //注册监听
    [[StockData stocData] addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    [self addLabel];
    [self addButton];
}
//处理属性改变事件 
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"price"])
    {
        self.myLabel.text = [(NSNumber*)[[StockData stocData] valueForKey:@"price"] stringValue];
    }
}
#pragma mark - Add Label
- (void) addLabel
{
    _myLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    self.myLabel.textColor = [UIColor blackColor];
    self.myLabel.text = [(NSNumber*)[[StockData stocData] valueForKey:@"price"] stringValue];
    [self.view addSubview:self.myLabel];
}
#pragma mark - Add Button
- (void) addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 30);
    [button addTarget:self action:@selector(buttonModel:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void) buttonModel:(int) sender
{
    [[StockData stocData] setValue:@"20.0" forKey:@"price"];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
