//
//  GPSViewController.m
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "GPSViewController.h"
#import "PMCalendar.h"

#import <QuartzCore/QuartzCore.h>
#import "LocationInformation.h"
@interface GPSViewController ()

@end

@implementation GPSViewController
@synthesize mapView=_mapView;
@synthesize locManager=_locManager;


- (id)initWithTitle:(NSString*)aTitle andSensorId:(NSString*)aId andDeviceId:(NSString *)aID
{
    self = [super init];
    if (self) {
        self.title=aTitle;
        _sensorId=aId;
        _deviceId=aID;
        _pageNo=1;
        _indicatorCount=0;
        _dataArray=[[NSMutableArray alloc]initWithCapacity:10];
        _indicatorArray=[[NSMutableArray alloc]initWithCapacity:10];
        locations = [[NSMutableArray alloc]initWithCapacity:10];
        _lineArray=[[NSMutableArray alloc]initWithCapacity:10];
        // Custom initialization
    }
    return self;
}
- (void)showError:(NSString *)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errorMessage delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
    [alert show];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	//MKMapView类 地图的创建
    _mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, LCDW, LCDH-44-49)];
    //地图的类型
    _mapView.mapType = MKMapTypeStandard;
    //设置代理
    _mapView.delegate = self;
    //显示用户定位
    _mapView.showsUserLocation = NO;
    [self.view addSubview:_mapView];
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if(result.height == 480.f)
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            _zoomLevel = 1;
            NSLog(@"iphone");
        }
        else//iphone 5
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            _zoomLevel = 1;;
            NSLog(@"iphone5");
        }
    }
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if(result.height == 768.f)//ipad mini  ipad 2
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            _zoomLevel = 1;
            NSLog(@"ipadmini");
        }
        else//ipad 3  ipad 4
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            _zoomLevel = 1;;
            NSLog(@"ipad4");
        }
    }
    MKCoordinateRegion region = MKCoordinateRegionMake(_coords, MKCoordinateSpanMake(_zoomLevel, _zoomLevel));
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES]; 
    
    _locManager = [[CLLocationManager alloc] init];
    
    _locManager.delegate = self;
    
    _locManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _locManager.distanceFilter = 100;
    
    [_locManager startUpdatingLocation];

    UIImage* image = [UIImage imageNamed:@"足迹.jpg"];
    _editTimeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 50, 30)];
    [_editTimeButton setImage:image forState:UIControlStateNormal];
    [_editTimeButton addTarget:self action:@selector(editTime) forControlEvents:UIControlEventTouchUpInside];
    _editTimeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_editTimeButton];
    self.navigationItem.rightBarButtonItem = _editTimeButtonItem;
    
    _stopButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_stopButton setFrame:CGRectMake(10, 10, 50, 30)];
    [_stopButton setTitle:@"暂停" forState:UIControlStateNormal];
    [_stopButton addTarget:self action:@selector(stopGPSShow) forControlEvents:UIControlEventTouchUpInside];
    [_stopButton setHidden:YES];
    [self.view addSubview:_stopButton];
    
    _editTimeView=[[UIView alloc]initWithFrame:self.view.bounds];
    [_editTimeView setBackgroundColor:[UIColor darkGrayColor]];
    [_editTimeView setHidden:YES];
    [self.view addSubview: _editTimeView];
    
    NSDate *datenow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: datenow];
    NSDate *localeDate = [datenow dateByAddingTimeInterval: interval];
    NSString* timeString=[NSString stringWithFormat:@"%@",localeDate ];
    
    _startTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 50, 120, 40)];
    _startTimeLabel.layer.cornerRadius = 10;
    _startTimeLabel.text=[timeString substringToIndex:10];
    [_editTimeView addSubview:_startTimeLabel];
    
    _startTimeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_startTimeButton setFrame:CGRectMake(100, 50, 120, 40)];
    [_startTimeButton addTarget:self action:@selector(showDate:) forControlEvents:UIControlEventTouchUpInside];
    [_startTimeButton setTag:1];
    [_editTimeView addSubview:_startTimeButton];
    
   
    
    
    _endTimeLabel=[[UILabel alloc]initWithFrame:CGRectMake(100, 120, 120, 40)];
    _endTimeLabel.text=[timeString substringToIndex:10];
    _endTimeLabel.layer.cornerRadius = 10;
    [_editTimeView addSubview:_endTimeLabel];
    
    _endTimeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_endTimeButton setFrame:CGRectMake(100, 120, 120, 40)];
    [_endTimeButton addTarget:self action:@selector(showDate:) forControlEvents:UIControlEventTouchUpInside];
    [_endTimeButton setTag:2];
    [_editTimeView addSubview:_endTimeButton];
    
    _doneButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_doneButton setFrame:CGRectMake(100, 190, 120, 40)];
    [_doneButton addTarget:self action:@selector(editTimeDone) forControlEvents:UIControlEventTouchUpInside];
    [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
    [_editTimeView addSubview:_doneButton];
    
    
    
    _indicatorView=[[MyIndicatorView alloc]initWithCenter:CGPointMake(LCDW/2, (LCDH-44-49)/2)];
    [_indicatorView setHidden:YES];
    [self.view addSubview:_indicatorView];
    
	// Do any additional setup after loading the view.
}
//*********************************************************************************
- (MKPolyline *)makePolylineWithLocations:(NSMutableArray *)newLocations{
    
    MKMapPoint *pointArray = malloc(sizeof(CLLocationCoordinate2D)* newLocations.count);
    
    for(int i = 0; i < newLocations.count; i++)
        
    {
        
        // break the string down even further to latitude and longitude fields.
        
        NSString* currentPointString = [newLocations objectAtIndex:i];
        
        NSArray* latLonArr = [currentPointString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        
        CLLocationDegrees latitude  = [[latLonArr objectAtIndex:0] doubleValue];
        
        //        NSLog(@"latitude-> %f", latitude);
        
        CLLocationDegrees longitude = [[latLonArr objectAtIndex:1] doubleValue];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        
        
        pointArray[i] = MKMapPointForCoordinate(coordinate);
    }
    routeLine = [MKPolyline polylineWithPoints:pointArray count:newLocations.count];
    [_lineArray addObject:routeLine];
    free(pointArray);
    return routeLine;
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:overlay{
    
    
    if ([overlay isKindOfClass:[MKPolyline class]]) {
        
        MKPolylineView *routeLineView = [[MKPolylineView alloc] initWithPolyline:routeLine];
        
        routeLineView.strokeColor = [UIColor greenColor];
        
        routeLineView.lineWidth = 3;
        
        return routeLineView;
        
    }
    
    return nil;
    
}
//*********************************************************************************

- (void)viewWillDisappear:(BOOL)animated
{
    if([_timer isValid])
    {
        [_timer invalidate];
    }
    if(_stopButton.hidden==NO)
    {
        [_stopButton setTitle:@"开始" forState:UIControlStateNormal];
        [_stopButton addTarget:self action:@selector(startGPSShow) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)editTime
{
    if([_timer isValid])
    {
        [_timer invalidate];
    }
    
    [_mapView removeAnnotations:_indicatorArray];
    [_indicatorArray removeAllObjects];
    
    
    
    [_mapView removeOverlays:_lineArray];
    [_lineArray removeAllObjects];
    [locations removeAllObjects];
    
    [_dataArray removeAllObjects];
    _indicatorCount=0;
    [_editTimeView setHidden:NO];
}
- (void)showDate:(UIButton*)sender
{
    PMCalendarController*pmCC = [[PMCalendarController alloc] init];
    pmCC.delegate = self;
    pmCC.mondayFirstDayOfWeek = YES;
    
    [pmCC presentCalendarFromView:sender
         permittedArrowDirections:PMCalendarArrowDirectionAny
                         animated:YES];
    [self calendarController:pmCC didChangePeriod:pmCC.period];
    pmCC.title=[NSString stringWithFormat:@"%d",sender.tag];

}

- (void)editTimeDone
{
    if([_startTimeLabel.text compare:_endTimeLabel.text]==NSOrderedDescending)
    {
        [self showError:@"起始时间必须晚于结束时间"];
        return;
    }
    _startTime=[NSString stringWithFormat:@"%@T00:00:00",_startTimeLabel.text];
    _endTime=[NSString stringWithFormat:@"%@T23:59:59",_endTimeLabel.text];
    [_editTimeView setHidden:YES];
    [self asynRequest];
}
-(void)calendarController:(PMCalendarController *)calendarController didChangePeriod:(PMPeriod *)newPeriod
{
    if([calendarController.title isEqualToString:@"1"])
    {
        _startTimeLabel.text = [NSString stringWithFormat:@"%@"
                        , [newPeriod.startDate dateStringWithFormat:@"yyyy-MM-dd"]
                        ];
    }
    if([calendarController.title isEqualToString:@"2"])
    {
        _endTimeLabel.text = [NSString stringWithFormat:@"%@"
                        , [newPeriod.startDate dateStringWithFormat:@"yyyy-MM-dd"]
                        ];
    }
    
}

- (void)asynRequest
{
    [_dataArray removeAllObjects];
    //异步请求
    NSString *urlString = [NSString stringWithFormat:@"http://api.yeelink.net/v1.0/device/%@/sensor/%@.json?start=%@&end=%@&interval=1&page=%d",
                           _deviceId,_sensorId,_startTime,_endTime,_pageNo];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:[[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"] forHTTPHeaderField:@"U-ApiKey"];
    [NSURLConnection connectionWithRequest:request delegate:self];
    [_indicatorView appearWithTitle:@"加载中..."];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* responses = (NSHTTPURLResponse*)response;
    NSLog(@"%d",[responses statusCode]);
    _finalData=[[NSMutableData alloc]init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_finalData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"%@",[[NSString alloc] initWithData:_finalData encoding:NSUTF8StringEncoding]);
    NSJSONSerialization* json = [NSJSONSerialization JSONObjectWithData:_finalData options:NSJSONReadingMutableContainers error:nil];
    NSArray* array = (NSArray*)json;
    [_indicatorView disAppear];
    if(array.count==0)
    {
        [self showError:@"该时间段内无数据"];
        return;
    }
    
    for (int i=0; i<array.count; i++)
    {
        LocationInformation* infomation=[[LocationInformation alloc]init];
        infomation.timeStamp=[self DateFromDate:[[array objectAtIndex:i]valueForKey:@"timestamp"]];
        infomation.moveSpeed=[[array objectAtIndex:i]valueForKeyPath:@"value.speed"];
        infomation.latitude=[[array objectAtIndex:i]valueForKeyPath:@"value.lat"];
        infomation.longitude=[[array objectAtIndex:i]valueForKeyPath:@"value.lng"];
        [_dataArray addObject:infomation];
    }
    
    _timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(GPSShow) userInfo:nil repeats:YES];
    [_timer fire];
    [_stopButton setHidden:NO];
}
- (void)stopGPSShow
{
[_timer invalidate];
    [_stopButton setTitle:@"开始" forState:UIControlStateNormal];
    [_stopButton addTarget:self action:@selector(startGPSShow) forControlEvents:UIControlEventTouchUpInside];
}
-(void)startGPSShow
{
_timer=[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(GPSShow) userInfo:nil repeats:YES];
    [_timer fire];
    [_stopButton setTitle:@"暂停" forState:UIControlStateNormal];
    [_stopButton addTarget:self action:@selector(stopGPSShow) forControlEvents:UIControlEventTouchUpInside];
}
- (void)GPSShow
{
    if( _indicatorCount>= _dataArray.count)
    {
        [_timer invalidate];
        [_stopButton setHidden:YES];
        return;
    }
        
    NSString *string=[NSString stringWithFormat:@"纬度:%@ 经度:%@ 时速:%@",[[_dataArray objectAtIndex:_indicatorCount] latitude],[[_dataArray objectAtIndex:_indicatorCount] longitude],[[_dataArray objectAtIndex:_indicatorCount] moveSpeed]];
    
    _coords = CLLocationCoordinate2DMake([[[_dataArray objectAtIndex:_indicatorCount] latitude] floatValue] ,[[[_dataArray objectAtIndex:_indicatorCount] longitude] floatValue]);
    _zoomLevel = 1;;
    MKCoordinateRegion region = MKCoordinateRegionMake(_coords, MKCoordinateSpanMake(_zoomLevel, _zoomLevel));
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    //连线
    [locations addObject:[NSString stringWithFormat:@"%@,%@", [[_dataArray objectAtIndex:_indicatorCount] latitude] , [[_dataArray objectAtIndex:_indicatorCount] longitude]]];
    [_mapView addOverlay:[self makePolylineWithLocations:locations]];
    [self createAnnotationWithCoords:_coords andTitle:[[_dataArray objectAtIndex:_indicatorCount] timeStamp] andSubTitle:string];
    
    
    [_mapView selectAnnotation:_annotation animated:NO];
    _indicatorCount++;

}
- (NSString *)DateFromDate:(NSString*)aDate
{
    NSString *str1=[aDate substringToIndex:10];
    NSLog(@"%@",str1);
    NSString *str2=[aDate substringFromIndex:11];
    NSLog(@"%@",str2);
    NSString *timeStr=[NSString stringWithFormat:@"%@ %@",str1,str2];
    return timeStr;
}

//自定义指针图形
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:_annotation
                                                       reuseIdentifier:@"CustomAnnotation"];
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"指针.png"];
    
    
    
    return annotationView;
}
-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) aCoords andTitle:(NSString*)aTitle andSubTitle:(NSString*)aSubTitle
{
    _annotation = [[MapAnnotation alloc] initWithCoordinate:
                                 aCoords];
    _annotation.title = aTitle;
    _annotation.subtitle = aSubTitle;
    
    [_mapView addAnnotation:_annotation];
    [_indicatorArray addObject:_annotation];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
