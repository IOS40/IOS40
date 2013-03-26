//
//  GPSViewController.h
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMCalendar.h"
#import "MapAnnotation.h"
@interface GPSViewController : UIViewController<MKMapViewDelegate,PMCalendarControllerDelegate,CLLocationManagerDelegate>
{
    CLLocationCoordinate2D _coords;
    NSString* _sensorId;
    NSString* _deviceId;
    int _pageNo;
    NSString* _startTime;
    NSString* _endTime;
    MyIndicatorView* _indicatorView;
    NSMutableArray *_dataArray;
    NSMutableData *_finalData;
    UIView *_editTimeView;
    UILabel *_startTimeLabel;
    UILabel *_endTimeLabel;
    UIButton *_startTimeButton;
    UIButton *_endTimeButton;
    UIButton *_doneButton;
    NSTimer *_timer;
    UIButton *_editTimeButton;
    UIBarButtonItem *_editTimeButtonItem;
    UIButton *_stopButton;
    NSMutableArray *_indicatorArray;
    int _indicatorCount;
    float _zoomLevel;
    MapAnnotation *_annotation;
    MKPolyline *routeLine;
    NSMutableArray *locations;
    NSMutableArray *_lineArray;
    
    
}
@property (strong,nonatomic) MKMapView * mapView;
@property (nonatomic, retain) CLLocationManager *locManager;
- (id)initWithTitle:(NSString*)aTitle andSensorId:(NSString*)aId andDeviceId:(NSString*)aID;
@end
