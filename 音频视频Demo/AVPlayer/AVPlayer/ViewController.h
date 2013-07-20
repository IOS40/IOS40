//
//  ViewController.h
//  AVPlayer
//
//  Created by Ibokan on 12-11-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AudioViewController,MovieViewController;
@interface ViewController : UIViewController
@property (strong, nonatomic) AudioViewController *audioViewController;
@property (strong, nonatomic) MovieViewController *movieViewController;
-(void)pushAudioPlay:(id)sender;
-(void)pushMoviePlay:(id)sender;
@end
