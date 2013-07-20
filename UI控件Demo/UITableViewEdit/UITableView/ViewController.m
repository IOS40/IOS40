//
//  ViewController.m
//  UITableView
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tableView = _tableView;

@synthesize cellArray = _cellArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460 - 44) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    _cellArray = [[NSMutableArray alloc] initWithCapacity:10];
    
    for (int i = 1; i <= 100; i++)
    {
        NSString *string = [NSString stringWithFormat:@"%d",i];
        
        [self.cellArray addObject:string];
    }
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.editButtonItem.title = @"编辑";
}
//设置行数
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellArray.count;
}
//重用机制
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifiter = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifiter];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifiter];
    }
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    return cell;
}

//cell将要出现调用此方法
- (void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self.cellArray objectAtIndex:indexPath.row];
    
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

//点击cell回调方法
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewRowAnimationAutomatic];
}

//设置cell可以编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//设置cell可以移动
- (BOOL) tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//编辑按钮回调方法
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [self.tableView setEditing:editing animated:animated];
    [super setEditing:editing animated:animated];
    
    if (editing)
    {
        self.editButtonItem.title = @"完成";
        NSString *string = @"添加";
        [self.cellArray addObject:string];
        [self.tableView reloadData];
    }
    else
    {
        self.editButtonItem.title = @"编辑";
        [self.cellArray removeLastObject];
        [self.tableView reloadData];
    }
}

//cell编辑后的样式
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.cellArray.count - 1)
    {
        return UITableViewCellEditingStyleInsert;
    }
    else
    {
        return UITableViewCellEditingStyleDelete;
    }
}

//点击删除调用的方法
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSInteger row = [indexPath row];
        [self.cellArray removeObjectAtIndex:row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        NSInteger row = [indexPath row];
        
        NSArray *insertIndexPath = [NSArray arrayWithObjects:indexPath, nil];
        
        NSString *mes = @"添加新的元素";
        
        [self.cellArray insertObject:mes atIndex:row];//添加单元行的设置的标题
        
        [tableView insertRowsAtIndexPaths:insertIndexPath withRowAnimation:UITableViewRowAnimationRight];
    }
}
//实现移动的方法
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSInteger fromRow = [sourceIndexPath row];//需要移动的行
    
    NSInteger toRow = [destinationIndexPath row];//获取移动某处的位置
    
    id object = [self.cellArray objectAtIndex:fromRow];//从数组中读取需要移动的数据
    
    [self.cellArray removeObjectAtIndex:fromRow];//在数组中移动需要移动的行的数据
    
    [self.cellArray insertObject:object atIndex:toRow];//把需要移动的单元格数据在数组中华，移动到想要移动的数据前面
    
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
