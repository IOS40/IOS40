//
//  ViewController.m
//  iPhone_Test
//
//  Created by  on 12-9-17.
//  Copyright (c) 2012年 cofortune. All rights reserved.
//

#import "ViewController.h"
#import "MutableSelectViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"edit" style:UIBarButtonItemStyleDone target:self action:@selector(tableViewEdit:)];
    
    self.dataMutableArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 50; i++) {
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [_dataMutableArray addObject:str];
    }
}

- (void)tableViewEdit:(id)sender{
    [_tableview setEditing:!self.tableview.editing animated:YES];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataMutableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"] autorelease];
    }
    
    cell.detailTextLabel.text = [_dataMutableArray objectAtIndex:indexPath.row];
    
    return cell;
}

//哪几行可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 4) {
        return NO;
    }
    return YES;
}

//哪几行可以移动(可移动的行数小于等于可编辑的行数)
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 5) {
        return NO;
    }
    return YES;
}

//移动cell时的操作
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    
    if (sourceIndexPath != destinationIndexPath) {
        
        id object = [self.dataMutableArray objectAtIndex:sourceIndexPath.row];
        [object retain];
        [self.dataMutableArray removeObjectAtIndex:sourceIndexPath.row];
        if (destinationIndexPath.row > [self.dataMutableArray count]) {
            [self.dataMutableArray addObject:object];
        }
        else {
            [self.dataMutableArray insertObject:object atIndex:destinationIndexPath.row];
        }
        [object release];
    }
}

//继承该方法时,左右滑动会出现删除按钮(自定义按钮),点击按钮时的操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.dataMutableArray removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableview deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    
}

#pragma mark - UITableViewDelegate

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        
        return @"测试捏";
    }
    return @"删除";
}

//当 tableview 为 editing 时,左侧按钮的 style
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

//移动 cell,防止移动 cell到不支持移动的列表下面
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    if (proposedDestinationIndexPath.row > 3) {
        return sourceIndexPath;
    }
    return proposedDestinationIndexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MutableSelectViewController *mvc = [[MutableSelectViewController alloc] init];
    [self.navigationController pushViewController:mvc animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
