//
//  UIImageView+drawImage.h
//  HTTPDownloadResume
//
//  Created by Ibokan on 12-8-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView(UIImageViewDrawImage)

- (void)drawImage:(UIImage*)image withSuperView:(UIView*)superView frameOrigin:(CGPoint)frmOrigin imageOrigin:(CGPoint)imgOrigin imageSize:(CGSize)imgSize;

@end
