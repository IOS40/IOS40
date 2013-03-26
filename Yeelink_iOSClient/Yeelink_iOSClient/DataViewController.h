//
//  CurveViewController.h
//  RealTimeCurve
//
//  Created by wu xiaoming on 13-1-24.
//  Copyright (c) 2013年 wu xiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyIndicatorView.h"
#import "CorePlot-CocoaTouch.h"
@interface DataViewController : UIViewController<CPTPlotDataSource, CPTAxisDelegate,UIActionSheetDelegate>
{
    NSString* _sensorId;
    MyIndicatorView* _indicatorView;
    NSMutableData* _finalData;
    CPTGraphHostingView *_hostingView;
    CPTScatterPlot              *_dataSourceLinePlot;//线
    NSMutableArray *_dataForPlot;
    CPTXYGraph *_graph;
    float _yMinValue;
    float _yMaxValue;
    NSMutableArray *_dataArray;
    float _xMinValue;
    float _xMaxValue;
    UILabel *_timeLabel;
    NSString *_time;
    NSString *_timeText;
    UIActionSheet *_sheet;
    float _timeCount;
}
- (id)initWithTitle:(NSString*)aTitle andSensorId:(NSString*)aId;

@end

