//
//  ViewController.h
//  UIActionSheet
//
//  Created by Ibokan on 12-12-25.
//  Copyright (c) 2012年 Ibokan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIActionSheetDelegate>

{
    UIButton *_button;
}

- (void) addButton;

- (void) actionSheet:(UIButton*) sender;

@end
