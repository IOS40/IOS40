//
//  AudioViewController.m
//  AVPlayer
//
//  Created by Ibokan on 12-11-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import "AudioViewController.h"

@interface AudioViewController ()

@end

@implementation AudioViewController
@synthesize audioPlayer = _audioPlayer;
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
    [self setTitle:@"音乐"];
    [self.view setBackgroundColor:[UIColor grayColor]];
	// Do any additional setup after loading the view.
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startButton setFrame:CGRectMake(10, 300, 50, 40)];
    [startButton setTitle:@"开始" forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startPlay:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *pauseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pauseButton setFrame:CGRectMake(110, 300, 50, 40)];
    [pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseButton addTarget:self action:@selector(pausePlay:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [stopButton setFrame:CGRectMake(180, 300, 50, 40)];
    [stopButton setTitle:@"停止" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stopPlay:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:startButton];
    [self.view addSubview:pauseButton];
    [self.view addSubview:stopButton];
    
    [self loadAudio];
    
    
}

-(void) loadAudio
{
    NSData *audioData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"刘哈哈与大先生" ofType:@"mp3"]];
    _audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:nil];
    [self.audioPlayer setMeteringEnabled:YES];
}

-(void) startPlay:(id) sender;
{
    if (self.audioPlayer && ![self.audioPlayer isPlaying])
    {
        [self.audioPlayer play];
    }
    else if(self.audioPlayer == nil )
    {
        [self loadAudio];
        [self.audioPlayer play];
    }
    
}
-(void) pausePlay:(id) sender;
{
    if(self.audioPlayer && [self.audioPlayer isPlaying])
    {
        [self.audioPlayer pause];
    }
}
-(void) stopPlay:(id) sender;
{
    if (self.audioPlayer)
    {
        [self.audioPlayer stop];
        self.audioPlayer = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
