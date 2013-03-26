//
//  HomePageViewController.h
//  Yeelink
//
//  Created by Wang Jun on 13-3-11.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapAnnotation.h"
#import "VPPMapHelper.h"
#import "VPPMapHelperDelegate.h"
@interface HomePageViewController : UIViewController<UITextFieldDelegate,MKMapViewDelegate,VPPMapHelperDelegate>
{
    CLLocationCoordinate2D _coords;
    MapAnnotation *_annotation;
    VPPMapHelper *_mapHelper;
}
@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) MKMapView * mapView;
@end
