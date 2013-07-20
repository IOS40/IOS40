//
//  ViewController.m
//  UISegmentedController
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

/**********************
 
 segment可放在导航条右侧
 
 **********************/
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"嘿",@"咻",@"嘿",@"咻", nil];
    
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:array];//以NSArray为参数初始化选择控件
    
    segment.frame = CGRectMake(0, 0, 320, 60);
    
    segment.selectedSegmentIndex = 0;//左侧第一选项默认被选择
    
    segment.segmentedControlStyle = UISegmentedControlStyleBar;//样式类型
    
    segment.tintColor = [UIColor grayColor];//设置控件颜色(只有当样式为Bar时才有效)
    
    segment.momentary = YES;//默认点击为高亮，设置高亮关闭
    
    [segment setTitle:@"哦耶" forSegmentAtIndex:3];//改变第四个的名字
    
    [segment setImage:[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"discuss@2x" ofType:@"png"]] forSegmentAtIndex:2];//改第三个名字为图片
    
    [segment setContentOffset:CGSizeMake(0, -10) forSegmentAtIndex:0];//修改第一个内容显示的为止
    
    [segment setEnabled:NO forSegmentAtIndex:1];//设置第二个选项不可选择
    
    [segment addTarget:self action:@selector(segmentDidChange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
    
/************************************************************************************************
     
追加图标型选项：segment insertSegmentWithImage:<#(UIImage *)#> atIndex:<#(NSUInteger)#> animated:<#(BOOL)#>
追加文本型选项：segment insertSegmentWithTitle:<#(NSString *)#> atIndex:<#(NSUInteger)#> animated:<#(BOOL)#>
删除指定的选项：segment removeSegmentAtIndex:<#(NSUInteger)#> animated:<#(BOOL)#>
删除说有的选项：segment removeAllSegments
     
*************************************************************************************************/
}

- (void) segmentDidChange:(UISegmentedControl*) sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segment = sender;
        
        if (0 == segment.selectedSegmentIndex)
        {
            self.view.backgroundColor = [UIColor greenColor];
        }
        if (1 == segment.selectedSegmentIndex)
        {
            self.view.backgroundColor = [UIColor grayColor];
        }
        if (2 == segment.selectedSegmentIndex)
        {
            self.view.backgroundColor = [UIColor yellowColor];
        }
        if (3 == segment.selectedSegmentIndex)
        {
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }
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
