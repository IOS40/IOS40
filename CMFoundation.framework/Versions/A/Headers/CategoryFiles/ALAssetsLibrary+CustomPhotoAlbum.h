//
//  ALAssetsLibrary category to handle a custom photo album
//
//  Created by Marin Todorov on 10/26/11.
//  Copyright (c) 2011 Marin Todorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

typedef void(^SaveImageCompletion)(NSError* error);

@interface ALAssetsLibrary(CustomPhotoAlbum)

/**
 *	@brief	保存到视频到相册
 *
 *	@param 	urlString 	视频的本地URL
 *	@param 	album 	相册名称(自定义)
 */
- (void)saveVideo:(NSString*)urlString toAlbum:(NSString*)album;
/**
*	@brief	保存图片到自定义相册
*
*	@param 	image 	image
*	@param 	albumName 	相册名称
*	@param 	completionBlock
*/
-(void)saveImage:(UIImage*)image toAlbum:(NSString*)albumName withCompletionBlock:(SaveImageCompletion)completionBlock;

@end