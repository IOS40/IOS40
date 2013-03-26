//
//  MapAnnotation.h
//  YeelinkClient
//
//  Created by Wang Jun on 13-3-13.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VPPMapCustomAnnotation.h"

@interface MapAnnotation : NSObject<MKAnnotation,VPPMapCustomAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coords;


@end
