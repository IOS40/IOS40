//
//  MovieViewController.m
//  UI_AudioVideoPalyer
//
//  Created by Ibokan on 12-11-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "MovieViewController.h"

// disable portrait mode for mp
@implementation MPMoviePlayerViewController(NoRotate)

//-(BOOL)shouldAutorotate
//{
//    return YES;
//}

//-(UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskLandscape;
//}

@end

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
	// Do any additional setup after loading the view.
    _moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:@"http://vr.tudou.com/v2proxy/v2.m3u8?it=156529594&st=3"]];
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.activityView setFrame:CGRectMake((320 - 60)/2, (480 - 20 - 44 - 60)/2, 60, 60)];
    [self.view addSubview:self.activityView];

}
- (IBAction)startPlayMovie:(id)sender
{
//    self.moviePlayer.moviePlayer.initialPlaybackTime = 10;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieLoaded) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    [self.moviePlayer.moviePlayer prepareToPlay];
    [self.activityView startAnimating];
}

- (void)movieLoaded
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    self.moviePlayer.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    [self presentMoviePlayerViewControllerAnimated:self.moviePlayer];
    [self presentModalViewController:self.moviePlayer animated:YES];
    if ([self.activityView isAnimating])
    {
        [self.activityView stopAnimating];
    }
    
    NSLog(@"------- start play --------");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.activityView = nil;
    self.moviePlayer = nil;
    [super dealloc];
}

@end
