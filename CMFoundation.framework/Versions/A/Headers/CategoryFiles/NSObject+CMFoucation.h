//
//  NSObject+CMFoucation.h
//  CMFoundation
//
//  Created by 王金宇 on 13-7-20.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CMFoucation)

/**
 *	@brief	获得系统当前时间
 *
 *	@param 	dataFormat 	时间的格式
 *
 *	@return	返回dataFormat格式的时间字符串
 */
- (NSString *)getDateString:(NSString*)dataFormat;
/**
 *	@brief	得到Library文件路径
 *
 *	@param 	path 	文件的相对路径
 *
 *	@return	包含Library路径在内的绝对路径
 */
- (NSString*)getPathWithLibraryPath:(NSString*)path;
/**
*	@brief	得到Document文件路径
*
*	@param 	path 	文件相对路径
*
*	@return	包含Document路径在内的绝对路径
*/
- (NSString*)getPathWithDocumnentPath:(NSString*)path;

/**
*	@brief	保存图片到Document目录下的指定目录
*
*	@param 	imageData 	图片data
*	@param 	direction 	document目录下要创建的文件夹
*	@param 	fileName 	保存的文件名
*
*	@return	保存图片后得到的相对路径
*/
- (NSString*)saveImage:(NSData*)imageData direction:(NSString*)direction fileName:(NSString*)fileName;

@end
