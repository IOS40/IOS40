//
//  QuartzView.h
//  记录
//
//  Created by Ibokan on 12-11-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzView : UIView
{

    CGPoint _point;//创建一个坐标的属性
    
    NSMutableArray *_pointArray;//创建一个存点的数组
    NSMutableArray *_lineArray;//创建一个存 点数组 的数组
    

}


-(void)clearLine:(id)sender;
-(void)stareLine:(id)sender;
-(void)huaSomething;
@end
