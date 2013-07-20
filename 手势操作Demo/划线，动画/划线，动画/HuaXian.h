//
//  HuaXian.h
//  划线，动画
//
//  Created by Ibokan on 12-11-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuaXian : UIView
{
    NSMutableArray *_lineArray;
    NSMutableArray *_pointArray;
    CGContextRef ref;
    UIColor *color ;
    UISegmentedControl *segmented;
}

-(void)huaSomething;
-(void)addSegmented;
-(void)Gesture:(id)sender;
-(void)addButton;
-(void)clearit:(id)sender;
-(void)clearit1:(id)sender;
@end
