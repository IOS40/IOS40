//
//  ViewController.h
//  WriteImageToPhotoLibrary
//
//  Created by 王金宇 on 13-3-29.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController* pickerController;
    ALAssetsLibrary *library;
}
- (IBAction)pickerViewController:(id)sender;

@end
