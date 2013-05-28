//
//  MovieViewController.m
//  AVPlayer
//
//  Created by Ibokan on 12-11-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController
@synthesize moviePlayer = _moviePlayer;
@synthesize activityView = _activityView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
	// Do any additional setup after loading the view.
    _moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vr.tudou.com/v2proxy/v2.m3u8?it=156529594&st=3"]];
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityView setFrame:CGRectMake(130, (480-20-44-60)/2, 60, 60)];
    [self.view addSubview:self.activityView];
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startButton setFrame:CGRectMake(10, 100, 300, 100)];
    [startButton setTitle:@"开始播放" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startMovie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startButton];
    
}

-(void)startMovie:(id) sender
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieLoaded) name:MPMovieDurationAvailableNotification object:nil];
    [self.moviePlayer.moviePlayer prepareToPlay];
    [self.activityView startAnimating];
}

-(void) movieLoaded
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMovieDurationAvailableNotification object:nil];
    self.moviePlayer.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:self.moviePlayer animated:YES completion:nil];
    if ([self.activityView isAnimating])
    {
        [self.activityView stopAnimating];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
