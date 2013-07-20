//
//  CMFoundation.h
//  CMFoundation
//
//  Created by 王金宇 on 13-7-20.
//
//

#import <UIKit/UIKit.h>

/**
 *	@brief	AISHTTPRequest类库 version 1.8
 *  需要:CFNetwork.framework / SystemConfiguration.framework / MobileCoreServices.framework / CoreGraphics.framework / libz.1.2.3.dylib支持
 *  ARC模式
 */
#import "ASIHttpRequest/ASIHTTPRequest.h"
#import "ASIHttpRequest/ASIFormDataRequest.h"

/**
 *	@brief	SDWebImage类库 version 3.0
 *  需要:ImageIO.framework / MapKie.Framework支持 build setting -> other link flags 添加 -ObjC 标志
 *  ARC模式
 */
#import "SDWebImage/SDWebImageManager.h"
#import "SDWebImage/SDWebImage.h"

/**
 *	@brief	瀑布流类库
 *  ARC模式
 */
#import "PSCollectionView/PSCollectionView.h"
#import "PSCollectionView/PSCollectionViewCell.h"

/**
 *	@brief	EGO下拉刷新类
 *  需要QuartCore.Framewor支持
 *  ARC模式
 */
#import "EGOPullRefresh/EGORefreshTableHeaderView.h"

/**
 *	@brief	FMDatabse类库
 *  需要: libsqlite3.0.dylib支持
 *  ARC模式
 */
#import "FMDataBase/FMDatabase.h"


/**
 *	@brief	MBProgressHUD进度符指示库
 *  ARC模式
 */
#import "MBProgressHUD/MBProgressHUD.h"


/**
 *	@brief	JSONKit
 *  ARC模式
 */
#import "JSONKit/JSONKit.h"


/**
 *	@brief	SBJson
 *  ARC模式
 */
#import "SBJSON/SBJson.h"



/**
 *	@brief	categoryFiles
 *  IdentifierAddition->生成机器唯一码
 *  MSDAddition->字符串生成MD5值
 *  NSStringPlus->URL编码
 *  CMFoucation->常用的方法收集
 */

#import "CategoryFiles/UIDevice+IdentifierAddition.h"
#import "CategoryFiles/NSString+MD5Addition.h"
#import "CategoryFiles/NSString+NSStringPlus.h"
#import "CategoryFiles/NSObject+CMFoucation.h"

/**
 *	@brief	保存文件到自定义相册, 保存完成后会发 kSaveToPhotoLibraryFinishedNotification通知, 通知的userInfo为 保存的文件类型和文件名。
 *  文件类型的key: kSaveMediaType;
 *  文件名称的key: kSaveMediaName;
 */
#import "CategoryFiles/ALAssetsLibrary+CustomPhotoAlbum.h"


/**
 *	@brief	常用宏定义
 */

#define kPSCollectionViewCellMargin  8

/*___________________________________________________________________________________
 
 *程序中常用的宏定义
 
 *———————————————————————————————————————————————————————————————————————————————————*/

//宏定义，定义主屏幕的宽度为LCDW，在程序中使用LCDW来替代绝对坐标，为了使应用程序自动适应屏幕
#define LCDW [[UIScreen mainScreen]bounds].size.width

//宏定义，定义主屏幕的高度为LCDH，在程序中使用LCDH来替代绝对坐标，为了使应用程序自动适应屏幕
#define LCDH [[UIScreen mainScreen]bounds].size.height

//宏定义，定义应用程序的文件路径，该路径指向程序的Library文件夹
#define App_FilePath_Library [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//宏定义，定义应用程序的文件路径，该路径指向程序的Document文件夹
#define App_FilePath_Document [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

//宏定义，用来读取应用程序的文件，比如图片等
#define App_ContentFile(aFileName,aFileType) [[NSBundle mainBundle]pathForResource:aFileName ofType:aFileType]

//根据三原色的R、G、B值得到UIColor
#define Color_RGB(r,g,b,alp) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alp]

//根据图片设置UIView的背景
#define ImageColor(Image) [UIColor colorWithPatternImage:Image]

//4英寸屏幕和3.5英寸屏幕的宽高像素比
#define HeightScale LCDH/480
#define WedthScale LCDW/320


#define   kSystemVersion    [[[UIDevice currentDevice] systemVersion] floatValue]

#define   kTextAlignmentLeft    if(kSystemVersion > 6.0) ? UITextAlignmentLeft      :   NSTextAlignmentLeft
#define   kTextAlignmentRight   if(kSystemVersion > 6.0) ? UITextAlignmentRight     :   NSTextAlignmentRight
#define   kTextAlignmentCenter  if(kSystemVersion > 6.0) ? UITextAlignmentCenter    :   NSTextAlignmentCenter

#pragma mark - 保存相册相关定义

static NSString* const  kSaveToPhotoLibraryFinishedNotification = @"kSaveToPhotoLibraryFinishedNotification";
static NSString* const  kSaveMediaType     =     @"mediaType";
static NSString* const  kSaveMediaName     =     @"mediaName";
#define   kVideoType    @"VIDEO"
#define   kImageType    @"IMAGE"


@interface CMFoundation : NSObject

@end
