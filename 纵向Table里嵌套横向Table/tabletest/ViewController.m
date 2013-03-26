//
//  ViewController.m
//  tabletest
//
//  Created by renren3 on 12-10-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    portable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    [portable setDelegate:self];
    [portable setDataSource:self];
    [self.view addSubview:portable];

	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
    {
        return @"1";
    }else if(section == 1)
    {
        return @"2";
    }else if(section == 2)
    {
        return @"3";
    }else if(section == 3)
    {
        return @"4";
    }else if(section == 4)
    {
        return @"5";
    }else if(section == 5)
    {
        return @"6";
    } else if(section == 5){

        return @"7";
    } else {
        return @"8";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellname = @"cell";
    InfoCell *cell = (InfoCell *)[tableView dequeueReusableCellWithIdentifier:cellname];
    if (cell == nil)
    {
        cell = [[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname]autorelease];
	}
    else
    {
		cell = [[[InfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellname]autorelease];
	}
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([indexPath section]==0) {
        NSLog(@"indexPath section%d",[indexPath section]);
        NSLog(@"rows === %d",[indexPath row]);
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [portable release];
    [super dealloc];
}

@end
