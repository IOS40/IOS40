//
//  RootViewController.m
//  CodeAccumulate
//
//  Created by 王金宇 on 13-4-10.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import "RootViewController.h"
#import "CycleScrollDemo.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.demoNameArray = [[NSMutableArray alloc] initWithObjects:@"CycleScrollDemo", nil];
}


#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    NSString* string = [NSString stringWithFormat:@"%d.%@",indexPath.row + 1, [self.demoNameArray objectAtIndex:indexPath.row]];
    cell.textLabel.text = string;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0)
    {
        CycleScrollDemo* cycleScroll = [self.storyboard instantiateViewControllerWithIdentifier:@"CycleScroll"];
        [self.navigationController pushViewController:cycleScroll animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    self.demoNameArray = nil;
    [super dealloc];
}

@end
