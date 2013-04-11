/* 
 *CMFoundation.h
 *
 *该文件为常用的宏定义，以及NSObject的类目，一些常用方法的整理
 *创建时间:2013 - 01 -24
 *作者:王金宇
 */

/*注意：
 *使用此框架需要导入：libsqlite3.dylib、libz.1.2.5.dylib、SystemConfiguration.framework、
 *MobileCoreServices.framework、CFNetwork.framework、QuartzCore.framework
 *在使用时，包含头文件
 #import <Foundation/Foundation.h>
 #import <CMFoundation/CMFoundation.h>
 #import <QuartzCore/QuartzCore.h>
 #import <SystemConfiguration/SystemConfiguration.h>
 #import <CFNetwork/CFNetwork.h>
 #import <MobileCoreServices/MobileCoreServices.h>
*/


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SystemInfo.h"

//StatusBarOverlay
#import "BWStatusBarOverlay.h"

//BadgeView
#import "JSBadgeView.h"

//JSONKit
#import "JSONKit.h"

//SBJSON
#import "NSObject+SBJson.h"
#import "SBJson.h"
#import "SBJsonParser.h"
#import "SBJsonStreamParser.h"
#import "SBJsonStreamParserAccumulator.h"
#import "SBJsonStreamParserAdapter.h"
#import "SBJsonStreamParserState.h"
#import "SBJsonStreamWriter.h"
#import "SBJsonStreamWriterAccumulator.h"
#import "SBJsonStreamWriterState.h"
#import "SBJsonTokeniser.h"
#import "SBJsonUTF8Stream.h"
#import "SBJsonWriter.h"

//SDWebImage
#import "MKAnnotationView+WebCache.h"
#import "SDImageCache.h"
#import "SDWebImageCompat.h"
#import "SDWebImageDecoder.h"
#import "SDWebImageDownloader.h"
#import "SDWebImageDownloaderOperation.h"
#import "SDWebImageManager.h"
#import "SDWebImageOperation.h"
#import "SDWebImagePrefetcher.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"


//MBProgressHUD
#import "MBProgressHUD.h"

//FMDataBase
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"
#import "FMDatabasePool.h"
#import "FMDatabaseQueue.h"
#import "FMResultSet.h"

//EGOPullRefresh
#import "EGORefreshTableHeaderView.h"

//MKNetWork
#import "NSAlert+MKNetworkKitAdditions.h"
#import "NSData+MKBase64.h"
#import "NSDate+RFC1123.h"
#import "NSDictionary+RequestEncoding.h"
#import "NSString+MKNetworkKitAdditions.h"
#import "UIAlertView+MKNetworkKitAdditions.h"
#import "UIImageView+MKNetworkKitAdditions.h"
#import "MKNetworkEngine.h"
#import "MKNetworkKit.h"
#import "MKNetworkOperation.h"
#import "Reachability.h"

//GDataXML
#import "GDataXMLNode.h"

//ASIHTTPRequest
#import "ASIAuthenticationDialog.h"
#import "ASICacheDelegate.h"
#import "ASIDataCompressor.h"
#import "ASIDataDecompressor.h"
#import "ASIDownloadCache.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "ASIHTTPRequestConfig.h"
#import "ASIHTTPRequestDelegate.h"
#import "ASIInputStream.h"
#import "ASINetworkQueue.h"
#import "ASIProgressDelegate.h"
#import "Reachability.h"

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
#define WedthScale LCDH/320

/*
 *适用于系统版本高于或者等于6.0的iOS系统
 */
//#define kLabelTextAlignmentLeft     NSTextAlignmentLeft
//#define kLabelTextAlignmentRight    NSTextAlignmentRight
//#define kLabelTextAlignmentCenter   NSTextAlignmentCenter
//#define kLineBreakModeWordWrap      NSLineBreakByWordWrapping


/*
 *适用于系统版本低于6.0的iOS系统
 */
#define kLabelTextAlignmentLeft     UITextAlignmentLeft
#define kLabelTextAlignmentRight    UITextAlignmentRight
#define kLabelTextAlignmentCenter   UITextAlignmentCenter
#define kLineBreakModeWordWrap      UILineBreakByWordWrap

@interface NSObject (CMFoundation)

/*********************************************************************
 *时间格式化、系统时间、沙盒路径相关
*********************************************************************/

/*
 *从一个时间字符串得到xx:xx:xx格式的时间
 *参数:字符串类型的时间长度
 *返回值:  XX:XX:XX 格式的时间
 */
- (NSString*)totalTimeFromTimeString:(NSString*)aTimeString;

/*
 *从一个单位为秒的时间值得到xx:xx:xx格式的时间
 *参数:整形的时间，单位为second
 *返回XX:XX:XX 格式的时间
 */
- (NSString*)totalTimeFromTimeInteger:(NSInteger)aTimeInteger;

/*
 *根据NSTimeInterval的时间得到xx:xx的时间
 *参数:NSTimeInterval时间戳
 *返回XX:XX 格式的时间，精确到秒
 */
- (NSString*)formatTime:(NSTimeInterval)aTime;

/*
 *得到NSDateComponents
 *可以根据该对象初始化系统时间、日期、日历等组件
 */
- (NSDateComponents*)getDateComponents;

/*
 *获取系统当前的weekDay,中文，例如"星期一"
 *返回当前的weekDay
 */
- (NSString*)systemCurrentWeekday;

/*
 *获取系统调用该方法的当前时间
 *返回 XX:XX:XX格式的时间 - 时/分/秒
 */
- (NSString*)systemCurrentTime;

/*
*获取系统调用该方法的当前日期
*返回 XX年XX月XX日格式的日期
*/
- (NSString*)systemCurrentDate;

/*
 *创建一个文件夹，并返回文件夹路径
 *返回文件夹路径名
 */
- (NSString*)getFilePathWithDirectoryPath:(NSString*)aDirectoryPath;

/*
 *在指定文件夹下写入数组或者字典
 *返回BOOL值 YES:successed,NO:unseccessed
 */
- (BOOL)writeToFileWithDirectory:(NSString*)directory fileName:(NSString*)fileName object:(id)object;

/*
 *检查在指定路径下是否存在文件
 *
 */
- (BOOL)checkFileExistsAtPath:(NSString*)path;

/*********************************************************************
 *数组排序相关方法
*********************************************************************/

/*
 *对MPMediaItemCollection进行排序，按照condition拼音顺序
 *condition 为MPMediaItemProperty类型
 *注意:MPMeidaItemProperty的属性必须为字符串类型，例如:MPMeidaItemPropertyTitle
 *返回排序后的数组
 */
//- (NSMutableArray*)sortCollections:(NSMutableArray*)collections WithString:(NSString*)condition;


@end
