//
//  ViewController.m
//  归档解档
//
//  Created by Ibokan on 13-1-5.
//  Copyright (c) 2013年 Ibokan. All rights reserved.
//

#import "ViewController.h"
#import "../MyProperty.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(0, 0, 100, 100)];
    [button1 setTitle:@"编码" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(addEncode) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(320-100, 0, 100, 100)];
    [button2 setTitle:@"解码" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(addDecoder) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
}

#pragma mark -创建路径
- (NSString*) addPath
{
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *path = [docPath stringByAppendingPathComponent:@"save"];
    
    return path;
}
#pragma mark -编码
- (void) addEncode
{
    //用于临时存放数据
    NSMutableData *data = [[NSMutableData alloc] init];
    
    MyProperty *myProperty = [[MyProperty alloc] initWithName:@"乔峰" andAddress:@"丐帮" andAge:35];
    
    //指定编码后的数据放在data中
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //编码，把myProperty转化为数据流存放在data中
    [archiver encodeObject:myProperty forKey:@"wodeshuxing"];
    
    //编码完成
    [archiver finishEncoding];
    
    [archiver release];
    //将已经生成的数据写到指定的路径下
    [data writeToFile:[self addPath] atomically:YES];
}
#pragma mark - 解码
- (void) addDecoder
{
    NSData *data = [[NSData alloc] initWithContentsOfFile:[self addPath]];
    
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    MyProperty *myProperty = [unArchiver decodeObjectForKey:@"wodeshuxing"];
    NSLog(@"%@",myProperty);
    NSLog(@"%@ %@ %d",myProperty.name,myProperty.address,myProperty.age);
    
    [unArchiver finishDecoding];
    
    [unArchiver release];
    
    [data release];
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
