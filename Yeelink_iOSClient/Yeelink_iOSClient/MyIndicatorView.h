//
//  MyIndicatorView.h
//  YeelinkClient
//
//  Created by Wang Jun on 13-3-16.
//  Copyright (c) 2013年 Wang Jun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyIndicatorView : UIView
@property(strong,nonatomic) UIActivityIndicatorView *indicatorView;
@property(strong,nonatomic) UILabel *label;
- (id)initWithCenter:(CGPoint)aCenter;
-(void)appearWithTitle:(NSString*)aTitle;
-(void)disAppear;
@end
