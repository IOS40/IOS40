//
//  CurveViewController.m
//  RealTimeCurve
//
//  Created by wu xiaoming on 13-1-24.
//  Copyright (c) 2013年 wu xiaoming. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (id)initWithTitle:(NSString*)aTitle andSensorId:(NSString*)aId
{
    self = [super init];
    if (self) {
        self.title=aTitle;
        _sensorId=aId;
        _dataForPlot=[[NSMutableArray alloc]initWithCapacity:10];
        _dataArray=[[NSMutableArray alloc]initWithCapacity:10];
        _time=@"1day";
        _timeText=@"最近1天";
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
   [super viewDidLoad];
    _indicatorView=[[MyIndicatorView alloc]initWithCenter:CGPointMake(LCDW/2, (LCDH-44-49)/2)];
    [_indicatorView setHidden:YES];
    [self.view addSubview:_indicatorView];
    
    [self asynRequest];
    
    
       
    _graph = [[CPTXYGraph alloc] initWithFrame:CGRectMake(0, 0, LCDW, LCDH-44-49-20)];
    
    //给画板添加一个主题
    CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme];
    [_graph applyTheme:theme];
    _hostingView = [[CPTGraphHostingView alloc] initWithFrame:CGRectMake(0, 0, LCDW, LCDH-44-49-20)];
    _hostingView.hostedGraph = _graph;
    [self.view addSubview:_hostingView];
    
    _graph.paddingLeft = 0;
	_graph.paddingTop = 0;
	_graph.paddingRight = 0;
	_graph.paddingBottom = 0;
    
    _graph.plotAreaFrame.paddingLeft = 45.0*LCDW/320.0;
    _graph.plotAreaFrame.paddingTop = 50.0*LCDH/480.0;
    _graph.plotAreaFrame.paddingRight = 45.0*LCDW/320.0;
    _graph.plotAreaFrame.paddingBottom = 80.0*LCDH/480.0;
    
    _timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(50*LCDW/320.0, 10*LCDH/480.0, 220*LCDW/320.0, 30*LCDH/480.0)];
    [_timeLabel setTextColor:[UIColor whiteColor]];
    [_timeLabel setBackgroundColor:[UIColor clearColor]];
    [_timeLabel setFont:[UIFont systemFontOfSize:22]];
    [_timeLabel setTextAlignment:NSTextAlignmentCenter];
    [_timeLabel setText:_timeText];
    [self.view addSubview:_timeLabel];
    
    
    _sheet=[[UIActionSheet alloc]initWithTitle:@"请选择时间段" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"最近1小时",
    @"最近3小时",
    @"最近12小时",
    @"最近1天",
    @"最近3天",
    @"最近1周",
    @"最近30天", nil];
    _sheet.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    
    UIBarButtonItem* editTime=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editTime)];
    self.navigationItem.rightBarButtonItem=editTime;
   
}
- (void)asynRequest
{
    [_dataArray removeAllObjects];
    [_dataForPlot removeAllObjects];
    //异步请求
    NSString *urlString = [NSString stringWithFormat:@"http://www.yeelink.net/mobile/sensor_data?login=%@&apikey=%@&sensor=%@&time=%@",
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"username"],
                           [[NSUserDefaults standardUserDefaults] objectForKey:@"authcode"],_sensorId,_time];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    [_indicatorView appearWithTitle:@"加载中..."];
}
- (void)editTime
{
    [_sheet showInView:_hostingView];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        _timeText=@"最近1小时";
        _time=@"1hr";
        [self asynRequest];
        return;
    }
    if(buttonIndex==1)
    {
        _timeText=@"最近3小时";
        _time=@"3hrs";
        [self asynRequest];
        return;
    }
    if(buttonIndex==2)
    {
        _timeText=@"最近12小时";
        _time=@"12hrs";
        [self asynRequest];
        return;
    }
    if(buttonIndex==3)
    {
        _timeText=@"最近1天";
        _time=@"1day";
        [self asynRequest];
        return;
    }
    if(buttonIndex==4)
    {
        _timeText=@"最近3天";
        _time=@"3days";
        [self asynRequest];
        return;
    }
    if(buttonIndex==5)
    {
        _timeText=@"最近1周";
        _time=@"1week";
        [self asynRequest];
        return;
    }
    if(buttonIndex==6)
    {
        _timeText=@"最近30天";
        _time=@"30days";
        [self asynRequest];
        return;
    }
}
- (void)drawChart
{
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)_graph.defaultPlotSpace;
    plotSpace.allowsUserInteraction = NO;
    //整个X轴一个值
    // [plotSpace setGlobalXRange:[CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0)length:CPTDecimalFromFloat(200.0)]];
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0) length:CPTDecimalFromFloat([_dataForPlot count]-1)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(_yMinValue) length:CPTDecimalFromFloat((_yMaxValue-_yMinValue)/5.0*6)];
    
    //设置坐标刻度大小
    CPTXYAxisSet *axisSet = (CPTXYAxisSet *) _graph.axisSet ;
    CPTXYAxis *x = axisSet.xAxis ;
    x. minorTickLineStyle = nil ;
    x. majorIntervalLength = CPTDecimalFromString ([NSString stringWithFormat:@"%d",[_dataForPlot count]-1]);
    // 坐标原点： 0
    x. orthogonalCoordinateDecimal = CPTDecimalFromString ([NSString stringWithFormat:@"%.1f",_yMinValue]);
    
    CPTXYAxis *y = axisSet.yAxis ;
    //y 轴：不显示小刻度线
    y. minorTickLineStyle = nil ;
    // 大刻度线间距
    y. majorIntervalLength = CPTDecimalFromString ( [NSString stringWithFormat:@"%.1f",(_yMaxValue-_yMinValue)/5.0] );
    // 坐标原点： 0
    y. orthogonalCoordinateDecimal = CPTDecimalFromString (@"0");
    CPTScatterPlot *scatterPlot = [[CPTScatterPlot alloc] initWithFrame:_graph.bounds];
    [_graph addPlot:scatterPlot];
    scatterPlot.dataSource = self;
    
    
    //清楚默认的轴标签，使用自定义的轴标签
    //x.labelingPolicy = CPTAxisLabelingPolicyNone;
    NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:10];
    //构造一个TextStyle
    static CPTMutableTextStyle *labelTextStyle = nil;
    labelTextStyle = [[CPTMutableTextStyle alloc] init];
    labelTextStyle.color = [CPTColor whiteColor];
    labelTextStyle.fontSize = 10.0f;
    

    NSDate *firstDate = [NSDate dateWithTimeIntervalSince1970:_xMinValue];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *firstDateString = [dateFormatter stringFromDate:firstDate];
    CPTAxisLabel *firstLabel = [[CPTAxisLabel alloc] initWithText:firstDateString textStyle:labelTextStyle];
    firstLabel.tickLocation = CPTDecimalFromInt(0);
    firstLabel.offset = x.labelOffset + x.majorTickLength;
    firstLabel.rotation = 0;
    [customLabels addObject:firstLabel];
    
   
    NSDate *lastDate = [NSDate dateWithTimeIntervalSince1970:_xMaxValue];
    NSString *lastDateString = [dateFormatter stringFromDate:lastDate];
    CPTAxisLabel *lastLabel = [[CPTAxisLabel alloc] initWithText:lastDateString textStyle:labelTextStyle];
    lastLabel.tickLocation = CPTDecimalFromInt(_dataArray.count-1);
    lastLabel.offset = x.labelOffset + x.majorTickLength;
    lastLabel.rotation = 0;
    [customLabels addObject:lastLabel];
    
    x.axisLabels = [NSSet setWithArray:customLabels];
    
    //创建绿色区域
    _dataSourceLinePlot = [[CPTScatterPlot alloc] init] ;
    //设置绿色区域边框的样式
    CPTMutableLineStyle *lineStyle = [_dataSourceLinePlot.dataLineStyle mutableCopy] ;
    lineStyle.lineWidth = 2.f;
    lineStyle.lineColor = [CPTColor greenColor];
    _dataSourceLinePlot.dataLineStyle = lineStyle;
    //设置透明实现添加动画
    _dataSourceLinePlot.opacity = 0.0f;
    
    //设置数据元代理
    _dataSourceLinePlot.dataSource = self;
    [_graph addPlot:_dataSourceLinePlot];
    
//    // 创建一个颜色渐变：从 建变色 1 渐变到 无色
//    CPTGradient *areaGradient = [ CPTGradient gradientWithBeginningColor :[CPTColor greenColor] endingColor :[CPTColor colorWithComponentRed:0.65 green:0.65 blue:0.16 alpha:0.2]];
//    // 渐变角度： -90 度（顺时针旋转）
//    areaGradient.angle = -90.0f ;
//    // 创建一个颜色填充：以颜色渐变进行填充
//    CPTFill *areaGradientFill = [ CPTFill fillWithGradient :areaGradient];
//    // 为图形设置渐变区
//    _dataSourceLinePlot. areaFill = areaGradientFill;
//    _dataSourceLinePlot. areaBaseValue = CPTDecimalFromString ( [NSString stringWithFormat:@"%.1f",_yMinValue] );
//    _dataSourceLinePlot.interpolation = CPTScatterPlotInterpolationLinear ;
    //添加动画效果
    CABasicAnimation *fadeInAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	fadeInAnimation.duration = 1.0f;
	fadeInAnimation.removedOnCompletion = NO;
	fadeInAnimation.fillMode = kCAFillModeForwards;
	fadeInAnimation.toValue = [NSNumber numberWithFloat:2.0];
	[_dataSourceLinePlot addAnimation:fadeInAnimation forKey:@"animateOpacity"];
    
    [_graph reloadData];
    
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
    NSDictionary* dictionary = (NSDictionary*)json;
    if (dictionary == nil)
    {
        [self showError: @"无法解析返回结果"];
        
    }
    else
    {
        [_dataArray addObjectsFromArray: [[[dictionary valueForKey:@"elements"] objectAtIndex:0] valueForKey:@"values"]];
        if([_dataArray count]!=0)
        {
            for (NSDictionary* dict in _dataArray )
            {
                NSString *yValue=[dict valueForKey:@"y"];
                [_dataForPlot addObject:yValue];
            }
            _yMaxValue=[[_dataForPlot objectAtIndex:0] floatValue];
            _yMinValue=[[_dataForPlot objectAtIndex:0] floatValue];
            _xMaxValue=[[[_dataArray objectAtIndex:_dataArray.count-1]valueForKey:@"x"]floatValue];
            _xMinValue=[[[_dataArray objectAtIndex:0]valueForKey:@"x"]floatValue];
            for (int i=1; i<_dataForPlot.count; i++)
            {
                if([[_dataForPlot objectAtIndex:i] floatValue]<_yMinValue)
                {
                    _yMinValue=[[_dataForPlot objectAtIndex:i] floatValue];
                }
                if([[_dataForPlot objectAtIndex:i] floatValue]>_yMaxValue)
                {
                    _yMaxValue=[[_dataForPlot objectAtIndex:i] floatValue];
                }
            }
            [self drawChart];
        }
        else
        {
            [self showError:@"暂无该传感器数据"];
        }
        
        
    }
    [_timeLabel setText:_timeText];
    [_indicatorView disAppear];
    
}
- (void)showError:(NSString *)errorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误提示" message:errorMessage delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles: nil];
    [alert show];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return [_dataArray count];
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index
{
    
    if(fieldEnum == CPTScatterPlotFieldY){    //询问 Y 值时
        return [_dataForPlot objectAtIndex:index];
    }else{                                    //询问 X 值时
        return [NSNumber numberWithInt:index];
    }
}

@end



