//
//  ViewController.m
//  AVPlayer
//
//  Created by Ibokan on 12-11-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "ViewController.h"
#import "AudioViewController.h"
#import "MovieViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize audioViewController = _audioViewController;
@synthesize movieViewController = _movieViewController;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"选择"];
    
    UIButton *audioButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [audioButton setFrame:CGRectMake(10, 50, 300, 80)];
    [audioButton addTarget:self action:@selector(pushAudioPlay:) forControlEvents:UIControlEventTouchUpInside];
    [audioButton setTitle:@"音频" forState:UIControlStateNormal];
    
    UIButton *movieButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [movieButton setFrame:CGRectMake(10, 360-88, 300, 80)];
    [movieButton setTitle:@"视频" forState:UIControlStateNormal];
    [movieButton addTarget:self action:@selector(pushMoviePlay:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:audioButton];
    [self.view addSubview:movieButton];
    
}

-(void)pushAudioPlay:(id)sender
{
    _audioViewController = [[AudioViewController alloc] init];
    [self.navigationController pushViewController:_audioViewController animated:YES];
}
-(void)pushMoviePlay:(id)sender
{
    _movieViewController = [[MovieViewController alloc] init];
    [self.navigationController pushViewController:_movieViewController animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
