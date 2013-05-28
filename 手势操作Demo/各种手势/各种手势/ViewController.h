//
//  ViewController.h
//  各种手势
//
//  Created by Ibokan on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    UIImageView* _imageView;
    CGPoint   _oldPoint;
    CGPoint   _newPoint;
    
    UISlider* slider;
}
-(void)addSlide;
-(void)addImageView;
-(void)addButton;
//-(void)loadGesture;
-(void)doubleTaped:(id)sender;
-(void)singleTaped:(id)sender;
-(void)changeImageViewImage;
-(void)pinched:(id)sender;
-(void)potaed:(id)sender;

-(void)startAni:(id)sender;
-(void)stopAni:(id)sender;
@end
