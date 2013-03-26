//
//  HomePageViewController.m
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "HomePageViewController.h"
#import "DeviceViewController.h"
#import "VPPMapHelper.h"
#import "MapAnnotation.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController
@synthesize textField=_textField;
@synthesize mapView=_mapView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated
{
    [_textField setHidden:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(5*LCDW/320.0,7,265*LCDW/320.0,30)];
    [_textField setBorderStyle:UITextBorderStyleRoundedRect];//设置样式
    _textField.placeholder = @"请输入需要搜索的信息";
    _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _textField.backgroundColor = [UIColor whiteColor];
    _textField.returnKeyType = UIReturnKeySearch;
    _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _textField.delegate = self;
    [self.navigationController.navigationBar addSubview:_textField];
    
    UIBarButtonItem* barButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchResult)];
    self.navigationItem.rightBarButtonItem=barButtonItem;
    
    
    
    //MKMapView类 地图的创建
    _mapView =[[MKMapView alloc]initWithFrame:CGRectMake(0, 0, LCDW, LCDH-44-49)];
    //地图的类型
    _mapView.mapType = MKMapTypeStandard;
    //设置代理
    _mapView.delegate = self;
    //显示用户定位
    _mapView.showsUserLocation = YES;
    [self.view addSubview:_mapView];
    float zoomLevel;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if(result.height == 480.f)
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            zoomLevel = 45;
            NSLog(@"iphone");
        }
        else//iphone 5
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            zoomLevel = 45;;
            NSLog(@"iphone5");
        }
    }
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        if(result.height == 768.f)//ipad mini  ipad 2
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            zoomLevel = 45;
            NSLog(@"ipadmini");
        }
        else//ipad 3  ipad 4
        {
            _coords = CLLocationCoordinate2DMake(35,106);
            zoomLevel = 45;
            NSLog(@"ipad4");
        }
    }

    
    
    _mapHelper = [VPPMapHelper VPPMapHelperForMapView:self.mapView
                             pinAnnotationColor:MKPinAnnotationColorGreen
                          centersOnUserLocation:NO
                          showsDisclosureButton:YES
                                       delegate:self];
    self.mapView.showsUserLocation = YES;
	_mapHelper.userCanDropPin = YES;
	_mapHelper.allowMultipleUserPins = YES;
	_mapHelper.pinDroppedByUserClass = [MapAnnotation class];

    
    [self tonsOfPins];
    MKCoordinateRegion region = MKCoordinateRegionMake(_coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
	// Do any additional setup after loading the view.
}
-(float)RandomFloatStart:(float)a end:(float)b {
    float random = ((float) rand()) / (float) RAND_MAX;
    float diff = b - a;
    float r = random * diff;
    return a + r;
}
- (void) tonsOfPins {
    srand((unsigned)time(0));
    
    NSMutableArray *tempPlaces=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 100; i++) {
        
        MapAnnotation *place= [[MapAnnotation alloc] init];
        place.coordinate = CLLocationCoordinate2DMake([self RandomFloatStart:25.0 end:45.0],[self RandomFloatStart:96.0 end:116.0]);
        place.image=[UIImage imageNamed:@"指针.png"];
        [place setTitle:[NSString stringWithFormat:@"Place %d title",i]];
        [tempPlaces addObject:place];
        
    }
    
    _mapHelper.shouldClusterPins = YES;
    [_mapHelper setMapAnnotations:tempPlaces];
}

- (void) open:(id<MKAnnotation>)annotation {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Annotation pressed" message:[NSString stringWithFormat:@"It says: %@",annotation.title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [av show];
}
//-(void)createAnnotationWithCoords:(CLLocationCoordinate2D) aCoords andTitle:(NSString*)aTitle andSubTitle:(NSString*)aSubTitle
//{
//    _annotation = [[MapAnnotation alloc] initWithCoordinate:
//                                    aCoords];
//    _annotation.title = aTitle;
//    _annotation.subtitle = aSubTitle;
//    [_mapView addAnnotation:_annotation];
//}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self searchResult];
    return YES;
}
- (void)searchResult
{
    [_textField resignFirstResponder];
    [_textField setHidden:YES];
    DeviceViewController* deviceViewController=[[DeviceViewController alloc]initWithStyle:UITableViewStylePlain];
    [self.navigationController pushViewController:deviceViewController animated:YES];
    
}
//自定义指针图形
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKAnnotationView *annotationView =[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomAnnotation"];
    annotationView = [[MKAnnotationView alloc] initWithAnnotation:_annotation
                                                  reuseIdentifier:@"CustomAnnotation"];
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"指针.png"];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button setFrame:CGRectMake(0, 0, 25, 25)];
    annotationView.rightCalloutAccessoryView=button;
    return annotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
