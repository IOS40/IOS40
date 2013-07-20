//
//  AudioViewController.m
//  UI_AudioVideoPalyer
//
//  Created by Ibokan on 12-11-22.
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
    if (self)
    {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSData* audioData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"zyh1" ofType:@"mp3"]];
    _audioPlayer = [[AVAudioPlayer alloc] initWithData:audioData error:nil];
}

- (IBAction)startPlay:(id)sender
{
    if (self.audioPlayer && ![self.audioPlayer isPlaying])
    {
        [self.audioPlayer play];
    }
}
- (IBAction)pausePlay:(id)sender
{
    if (self.audioPlayer && [self.audioPlayer isPlaying])
    {
        [self.audioPlayer pause];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.audioPlayer = nil;
    [super dealloc];
}

@end
