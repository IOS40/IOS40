//
//  ViewController.h
//  UI_gundong
//
//  Created by 韦博渊 on 12-12-11.
//  Copyright (c) 2012年 韦博渊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAccelerometerDelegate>
{
    @private
    UIImageView *_imageView;
    UIAccelerationValue _speedX;
    UIAccelerationValue _speedY;
    
}

@end
