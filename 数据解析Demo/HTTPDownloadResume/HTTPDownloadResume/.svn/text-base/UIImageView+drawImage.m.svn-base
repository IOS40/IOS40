//
//  UIImageView+drawImage.m
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIImageView+drawImage.h"

@implementation UIImageView(UIImageViewDrawImage)

- (void)drawImage:(UIImage*)aImage withSuperView:(UIView*)superView frameOrigin:(CGPoint)frmOrigin imageOrigin:(CGPoint)imgOrigin imageSize:(CGSize)imgSize
{
//    UIImageView* imgView = [[UIImageView alloc] init];
//    self.frame = CGRectMake(0, 0, imgSize.width, imgSize.height);
//    imgView.image = image;
//    [self setClipsToBounds:YES];
//    [imgView setAutoresizingMask:UIViewAutoresizingNone];
//    [imgView setContentMode:UIViewContentModeTopLeft];
//    imgView.frame = CGRectMake(-frmOrigin.x, -frmOrigin.y, image.size.width, image.size.height);
//    [self addSubview:imgView];
//    [superView addSubview:self];
//    UIImageView* imgSuperView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgSize.width, imgSize.height)];
    self.frame = CGRectMake(0, 0, aImage.size.width, aImage.size.height);
    UIImageView* imgsubView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, aImage.size.width, aImage.size.height)];
    [self setContentMode:UIViewContentModeScaleAspectFill];
//    [imgsubView setAutoresizingMask:UIViewAutoresizingNone];
    [imgsubView setContentMode:UIViewContentModeTopLeft];
    [imgsubView setImage:aImage];
    
    [self addSubview:imgsubView];
    [self setClipsToBounds:YES];
    [superView addSubview:self];
    
    
//    NSLog(@"%f",imgSuperView.frame.size.width);
//    NSLog(@"%f",imgSuperView.frame.size.height);
    NSLog(@"%f",imgsubView.frame.size.width);
    NSLog(@"%f",imgsubView.frame.size.height);
//    NSLog(@"%@",imgSuperView.frame);
//    NSLog(@"%@",imgsubView.frame);
    NSLog(@"%f",aImage.size.width);
    NSLog(@"%f",aImage.size.height);
    
//    [imgSuperView release];
    [imgsubView release];
    
}

@end
