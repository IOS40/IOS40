//
//  AudioViewController.h
//  AVPlayer
//
//  Created by Ibokan on 12-11-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AudioViewController : UIViewController
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
-(void) startPlay:(id) sender;
-(void) pausePlay:(id) sender;
-(void) stopPlay:(id) sender;
-(void) loadAudio;
@end
