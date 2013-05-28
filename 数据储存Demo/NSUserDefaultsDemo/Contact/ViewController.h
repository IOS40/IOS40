//
//  ViewController.h
//  Contact
//
//  Created by Lucifer on 13-4-7.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    
    IBOutlet UITextField *firestNameTextField;
    IBOutlet UITextField *lastNameTextField;
    IBOutlet UITextField *ageTextField;
    IBOutlet UIImageView *contactImageView;
}

- (IBAction)save:(id)sender;
- (IBAction)chooseImage:(id)sender;
@end
