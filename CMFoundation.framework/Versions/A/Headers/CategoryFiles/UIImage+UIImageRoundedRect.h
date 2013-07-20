//
//  UIImage+UIImageRoundedRect.h
//  WiFiPlusLive
//
//  Created by 王金宇 on 13-4-26.
//  Copyright (c) 2013年 wsw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageRoundedRect)


/**
 *	@brief	创建圆角图片
 *
 *	@param 	image 	原图
 *	@param 	size 	创建圆角图片的大小
 *	@param 	radius 	圆角的大小
 *
 *	@return	圆角图片
 */
+ (id) createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(float)radius;


- (UIImage*)initImmediateLoadWithContentsOfData:(NSData *)data;
+ (UIImage*)imageImmediateLoadWithContentsOfData:(NSData *)data;


/**
 *	@brief	等比缩放图片
 *
 *	@param 	image 	原图
 *	@param 	asize 	图片的大小
 *
 *	@return	缩放后的图片
 */
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;


+ (UIImage *)scaleAndRotateImage:(UIImage *)image;



@end
