//
//  ViewController.m
//  UI_gundong
//
//  Created by 韦博渊 on 12-12-11.
//  Copyright (c) 2012年 韦博渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"“china”的副本.gif"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.center = self.view.center;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |UIViewAutoresizingFlexibleTopMargin |UIViewAutoresizingFlexibleBottomMargin;
    [self.view addSubview:_imageView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //开始获取传感器传来的值
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = 1.0/60.0; //<60Hz
    accelerometer.delegate = self;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _speedX = _speedY =0.0;
    //结束从传感器取值
    UIAccelerometer *accelermeter = [UIAccelerometer sharedAccelerometer];
    accelermeter.delegate = nil;
}

//处理从加速传感器接收来的通知
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    _speedX += acceleration.x;//在X肘上附上加速度
    _speedY +=acceleration.y;
    CGFloat posX = _imageView.center.x+_speedX;
    CGFloat posY = _imageView.center.y-_speedY;
    
    if(posX < 0.0)
    {
        posX = 0.0;
        _speedX*=-0.4;
    }
    else if(posX > self.view.bounds.size.width)
    {
        posX = self.view.bounds.size.width;
        _speedX*=-0.4;
    }
    if(posY < 0.0)
    {
        posY =0.0;
        _speedY = 0.0;
    }
    else if(posY > self.view.bounds.size.height)
    {
        posY = self.view.bounds.size.height;
        _speedY*=-0.4;
    }
_imageView.center = CGPointMake(posX, posY);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
