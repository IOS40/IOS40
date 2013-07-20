//
//  QuartzView.m
//  记录
//
//  Created by Ibokan on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        
//        _point.x = 20.0f;//设定X坐标为20
//        _point.y = 20.0f;//设定Y坐标为20
        _lineArray = [[NSMutableArray alloc]init];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setFrame:CGRectMake(150, 400, 40, 50)];
        [button setTitle:@"清除" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clearLine:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button1 setFrame:CGRectMake(150, 350, 40, 50)];
        [button1 setTitle:@"开始" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(stareLine:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect//上下文必须在drawRact里面
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();//检查当前上下文
    CGContextSetLineWidth(context, 5.0f);//线的宽度
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);//指定比划颜色为蓝色
    CGContextMoveToPoint(context, _point.x, _point.y);//创建起始点
    CGContextAddLineToPoint(context, _point.x*2, _point.y*2);//添加一条线到这个点
    CGContextStrokePath(context);//开始绘制直线
    
    CGRect juXing = CGRectMake(_point.x, _point.y, _point.x*2+_point.x/2, _point.y*2+_point.y/2);//创建一个矩形
    CGContextAddRect(context, juXing);//把矩形放到上下文中
//    CGContextSetFillColorWithColor(context,[UIColor blackColor].CGColor);//填充颜色为黑色 
//    CGContextDrawPath(context,kCGPathFillStroke) ;//（与上句配套使用）先画边框后填充
//    CGContextDrawPath(context, kCGPathEOFillStroke);//(与上句意思一样) 先填充色后画边框
    CGContextStrokePath(context);
    
    CGRect tempRect = CGRectMake(_point.x-_point.x, _point.x-_point.x, _point.x*5, _point.y*5);//创建一个圆
    CGContextAddEllipseInRect(context, tempRect);//把圆放到上下文中
    CGContextStrokePath(context);
    
    CGContextAddArc(context, 100.0f, 100.0f, 20.0f, 3.1f, 0.0f, YES);//创建一个弧线 原点坐标 半径 弧度
    CGContextStrokePath(context);
    
    [self huaSomething];
    
}

-(void)clearLine:(id)sender
{
    _point.x = 0.0f;
    _point.y = 0.0f;
    [_lineArray removeLastObject];
    
    [self setNeedsDisplay];//给系统发消息，告诉系统从新调用drawRect的方法
}
-(void)stareLine:(id)sender
{
    _point.x = 20.0f;
    _point.y = 20.0f;
    
    [self setNeedsDisplay];
}

-(void)huaSomething
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ref, 5.0f);
    CGContextSetStrokeColorWithColor(ref, [UIColor blackColor].CGColor);
    for(int i = 0;i < _lineArray.count;i++)
    {
        for (int j = 0; j < [[_lineArray objectAtIndex:i] count]-1; j++)
        {
            CGPoint pointQiShi = [[[_lineArray objectAtIndex:i] objectAtIndex:j] CGPointValue];//创建起始点的坐标
            CGPoint pointJieShu = [[[_lineArray objectAtIndex:i] objectAtIndex:(j+1)] CGPointValue]; //创建结束点的坐标
            CGContextMoveToPoint(ref, pointQiShi.x, pointQiShi.y);
            CGContextAddLineToPoint(ref, pointJieShu.x, pointJieShu.y);
        }
    }
    CGContextStrokePath(ref);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _pointArray = [[NSMutableArray alloc] initWithCapacity:10];//开始触击屏幕就有点，所有要把点存进数组就得给点数组开辟一块内存
    
    UITouch *touch = [touches anyObject];//触击屏幕 把响应的点存进一个无序的集合
    CGPoint point = [touch locationInView:self];//返回 点击 点的坐标
    [_pointArray addObject:[NSValue valueWithCGPoint:point]];//把返回 点的坐标 存进点数组里
    [_lineArray addObject:_pointArray];//把点数组存进线数组里
    [_pointArray release];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [_pointArray addObject:[NSValue valueWithCGPoint:point]];
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}
@end


























