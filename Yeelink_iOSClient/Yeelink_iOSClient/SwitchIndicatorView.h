//
//  SwitchIndicatorView.h
//  Yeelink_iOSClient
//
//  Created by Wang Jun on 13-3-21.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchIndicatorView : UIView
{
    BOOL _switchState;
    NSString* _deviceId;
    NSString* _sensorId;
    NSMutableData *_finalData;
    NSHTTPURLResponse* _responses;
}
@property(strong,nonatomic) UIActivityIndicatorView *indicatorView;
@property(strong,nonatomic) UISwitch *dataSwitch;
- (id)initWithFrame:(CGRect)frame andState:(BOOL)aState andDeviceID:(NSString*)aDeviceId andSensorID:(NSString*)aSensorId;
@end
