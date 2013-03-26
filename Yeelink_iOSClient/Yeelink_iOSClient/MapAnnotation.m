//
//  MapAnnotation.m
//  YeelinkClient
//
//  Created by Wang Jun on 13-3-13.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "MapAnnotation.h"


@implementation MapAnnotation

@synthesize coordinate=_coordinate;
@synthesize title=_title;
@synthesize subtitle=_subtitle;
@synthesize pinAnnotationColor;
@synthesize opensWhenShown;
@synthesize image;
-(id) initWithCoordinate:(CLLocationCoordinate2D) coords
{
    if (self = [super init]) {
        _coordinate = coords;
    }
    return self;
}

@end
