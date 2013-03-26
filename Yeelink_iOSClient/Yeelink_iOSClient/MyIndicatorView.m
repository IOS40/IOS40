//
//  MyIndicatorView.m
//  YeelinkClient
//
//  Created by Wang Jun on 13-3-16.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import "MyIndicatorView.h"

@implementation MyIndicatorView
@synthesize indicatorView=_indicatorView;
@synthesize label=_label;



- (id)initWithCenter:(CGPoint)aCenter
{
    self = [super initWithFrame:CGRectMake(0, 0, 60, 80)];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        self.center=aCenter;
        _indicatorView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicatorView.frame=CGRectMake(5,5,50,50);
        [self addSubview:_indicatorView];
        
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 57, 60, 23)];
        [_label setBackgroundColor:[UIColor clearColor]];
        [_label setTextColor:[UIColor whiteColor]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        [_label setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_label];
        // Initialization code
    }
    return self; 
}
-(void)appearWithTitle:(NSString*)aTitle
{
    _label.text=aTitle;
    [_indicatorView startAnimating];
    [self setHidden:NO];
}
-(void)disAppear
{
    _label.text=@"";
    [_indicatorView stopAnimating];
    [self setHidden:YES];
}


@end
