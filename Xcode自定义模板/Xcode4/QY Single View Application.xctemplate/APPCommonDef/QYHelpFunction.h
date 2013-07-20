//
//  QYHelpFunction.h
//  UI_TableView2
//
//  Created by Ibokan on 12-11-13.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYHelpFunction : NSObject

@end


@interface NSDictionary (MutableDeepCopy)
//字典的深拷贝 mutableCopy为浅拷贝
- (NSMutableDictionary*)deepCopy;

@end



@interface StatusBarWindow : UIWindow

@property (strong, nonatomic) UILabel* label;

- (id)init;


- (void)setLabelText:(NSString*) aString;
- (void)show;
- (void)hidden;

@end