//
//  MovieViewController.h
//  UI_AudioVideoPalyer
//
//  Created by Ibokan on 12-11-22.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieViewController : UIViewController

@property (strong, nonatomic) MPMoviePlayerViewController* moviePlayer;
@property (strong, nonatomic) UIActivityIndicatorView* activityView;

@end
