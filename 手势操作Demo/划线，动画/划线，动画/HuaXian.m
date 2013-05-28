//
//  HuaXian.m
//  划线，动画
//
//  Created by Ibokan on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HuaXian.h"

@implementation HuaXian

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
        _lineArray = [[NSMutableArray alloc]init];
        color = [UIColor blackColor];
        [self addSegmented];
        [self addButton];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self huaSomething];
    
}
-(void)huaSomething
{
    ref = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ref, 5.0f);
//    CGContextSetStrokeColorWithColor(ref, color.CGColor);
    for(int i = 0;i < _lineArray.count;i++)
    {
        for (int j = 1; j < [[_lineArray objectAtIndex:i] count]-1; j++)
        {
            CGContextSetStrokeColorWithColor(ref, [[[_lineArray objectAtIndex:i]objectAtIndex:0]CGColor]);
            CGPoint pointQiShi = [[[_lineArray objectAtIndex:i] objectAtIndex:j] CGPointValue];
            CGPoint pointJieShu = [[[_lineArray objectAtIndex:i] objectAtIndex:(j+1)] CGPointValue]; 
            CGContextMoveToPoint(ref, pointQiShi.x, pointQiShi.y);
            CGContextAddLineToPoint(ref, pointJieShu.x, pointJieShu.y);
            CGContextStrokePath(ref);
        }
    }
    
}
-(void)Gesture:(id)sender
{
    for(UIGestureRecognizer *ges in self.gestureRecognizers)
    {
        [self removeGestureRecognizer:ges];
    }
    UISegmentedControl *seg = (UISegmentedControl*)sender;
    
    if(seg.selectedSegmentIndex == 0)
    {
        color = [UIColor redColor];
    }
    if(seg.selectedSegmentIndex == 1)
    {
        color = [UIColor orangeColor];
        [self setNeedsDisplay];
    }
    if(seg.selectedSegmentIndex == 2)
    {
        color = [UIColor yellowColor];
        [self setNeedsDisplay];
    }
    if(seg.selectedSegmentIndex == 3)
    {
        color = [UIColor greenColor];
        [self setNeedsDisplay];
    }
    if(seg.selectedSegmentIndex == 4)
    {
        color = [UIColor cyanColor];
        [self setNeedsDisplay];
    }
    if(seg.selectedSegmentIndex == 5)
    {
        color = [UIColor blueColor];
        [self setNeedsDisplay];
    }
    if(seg.selectedSegmentIndex == 6)
    {
        color = [UIColor purpleColor];
        [self setNeedsDisplay];
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _pointArray = [[NSMutableArray alloc] initWithCapacity:10];    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [_pointArray addObject:color];
    [_pointArray addObject:[NSValue valueWithCGPoint:point]];
    [_lineArray addObject:_pointArray];
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

-(void)addSegmented
{
    NSArray *array = [NSArray arrayWithObjects:@"红",@"橙",@"黄",@"绿",@"青",@"蓝",@"紫",nil];
    segmented = [[UISegmentedControl alloc]initWithItems:array]; 
    segmented.frame = CGRectMake(0, 460-50, 320, 50);
    [segmented setSegmentedControlStyle:UISegmentedControlStylePlain];
    segmented.backgroundColor = [UIColor grayColor];
    [segmented addTarget:self action:@selector(Gesture:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:segmented];
}

-(void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(320-50, 0, 50, 40);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"撤销" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clearit:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button1.frame = CGRectMake(320-50, 40, 50, 40);
    button1.backgroundColor = [UIColor grayColor];
    [button1 setTitle:@"清除" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(clearit1:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button1];
}

-(void)clearit:(id)sender
{
    [_lineArray removeLastObject];
    [self setNeedsDisplay];
}
-(void)clearit1:(id)sender
{
    [_lineArray removeAllObjects];
    [self setNeedsDisplay];
}


@end
