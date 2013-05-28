//
//  ViewController.m
//  UI_TEXTZD
//
//  Created by 韦博渊 on 12-12-6.
//  Copyright (c) 2012年 韦博渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mylabel = _mylabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _mylabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = self;
    accelerometer.updateInterval =  1.0f/60.0f;
    [self.view addSubview:_mylabel];
    [super viewDidLoad];
}
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    static NSInteger shakeCount=0;
    static NSDate *shakeStart;
    
    NSDate *now=[[NSDate alloc] init];
    //  摇晃 ２秒内
    NSDate *checkDate=[[NSDate alloc] initWithTimeInterval:2.0f sinceDate:shakeStart];
    
    //超过２秒  重计算晃动次数
    if ([now compare:checkDate]==NSOrderedDescending||shakeStart==nil){
        shakeCount=0;
        [shakeStart release];
        shakeStart=[[NSDate alloc] init];
    }
    
    [now release];
    [checkDate release];
    
    // 三轴摇晃的G力超过２则 列入计次
    if (fabsf(acceleration.x)>2.0 || fabsf(acceleration.y)>2.0|| fabsf(acceleration.z)>2.0){
        shakeCount++;
        
        //２秒内侦测到４次则判定为Shake摇晃手机
        if (shakeCount>4){
            shakeCount=0;
            [shakeStart release];
            shakeStart=[[NSDate alloc] init];
            
            //画面显示摇动文字
            _mylabel.text=@"你妹晃动了";
            
            //设定２秒后自动还原
//            [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(cleartext) userInfo:nil repeats:NO];
        }
    }
}

//-(void)cleartext{
//    _mylabel.text=@"没现象";
//}


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
