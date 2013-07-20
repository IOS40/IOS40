//
//  CCDownViewController.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCDownViewController.h"
#import "UIImageView+drawImage.h"

@implementation CCDownViewController

@synthesize downTableView = _downTableView;
@synthesize downloadArray = _downloadArray;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self loadDownloadInfo];
    [self loadDownloadTableView];
    
//    UIImage* img = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"68@2x" ofType:@"png"]];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
//    
//    [imageView setClipsToBounds:YES];
//    [imageView setBounds:CGRectMake(50, 50, 100, 100)];
//    [imageView setImage:img];
//    
//    [self.view addSubview:imageView];
    
}

- (void)loadDownloadInfo
{
    //example
//    @"http://allseeing-i.com/ASIHTTPRequest/tests/images/large-image.jpg"
//    @"http://allseeing-i.com/ASIHTTPRequest/tests/images/medium-image.jpg"
//    @"http://allseeing-i.com/ASIHTTPRequest/tests/images/small-image.jpg"
 
    NSString* url = [NSString stringWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/large-image.jpg"];
    CCDownloadInfo* info = [CCDownloadInfo downinfoWithUrl:[NSURL URLWithString:url] withLinkName:[url lastPathComponent]];
    url = [NSString stringWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/medium-image.jpg"];
    CCDownloadInfo* info1 = [CCDownloadInfo downinfoWithUrl:[NSURL URLWithString:url] withLinkName:[url lastPathComponent]];
    url = [NSString stringWithString:@"http://allseeing-i.com/ASIHTTPRequest/tests/images/small-image.jpg"];
    CCDownloadInfo* info2 = [CCDownloadInfo downinfoWithUrl:[NSURL URLWithString:url] withLinkName:[url lastPathComponent]];
    
    //创建CCDownloadInfo数组
    self.downloadArray = [self procDownloadArray:[NSArray arrayWithObjects:info,info1,info2, nil]];
}

//处理重复链接（在这里直接删掉）
- (NSArray*)procDownloadArray:(NSArray*) aArray
{
    NSMutableArray* arrTmp = [[NSMutableArray alloc] initWithCapacity:5];
    BOOL bRepeat = NO;
    BOOL bRepeat1 = NO;
    for (int i = 0; i < aArray.count; i++)
    {
        if (arrTmp.count == 0)
        {
            [arrTmp addObject:[aArray objectAtIndex:0]];
        }
        else
        {
            for (int j = 0; j < arrTmp.count; j++)
            {
                CCDownloadInfo* tmpDownloadInfo = [arrTmp objectAtIndex:j];
                if ([[[aArray objectAtIndex:i] url] isEqual:tmpDownloadInfo.url])
                {
                    bRepeat = YES;
                    bRepeat1 = YES;
                }
            }
            if (!bRepeat)
            {
                [arrTmp addObject:[aArray objectAtIndex:i]];
            }
            else
            {
                 bRepeat = NO;
            }
        }
    }
    if (bRepeat1) //只要有重复就弹出UIAlbertView
    {
        UIAlertView* albertView = [[UIAlertView alloc] initWithTitle:@"警告！" message:@"有重复的下载链接，已删除！" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:nil, nil];
        albertView.frame = CGRectMake(20, (480 - 160) / 2, 280, 160);
        albertView.alertViewStyle = UIAlertViewStyleDefault;
        [self.view addSubview:albertView];
        [albertView show];
        [albertView release];
    }

    return arrTmp;
}



- (void)loadDownloadTableView
{
    //加载TableView
    self.downTableView = [[CCDownTableView alloc] initWithArray:self.downloadArray];
    self.downTableView.frame = CGRectMake(0, 0, 320, 420);
    self.downTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.downTableView];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [_downTableView release];
    [_downloadArray release];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
 //   return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

@end
