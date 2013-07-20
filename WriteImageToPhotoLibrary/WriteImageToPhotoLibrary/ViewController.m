//
//  ViewController.m
//  WriteImageToPhotoLibrary
//
//  Created by 王金宇 on 13-3-29.
//  Copyright (c) 2013年 王金宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    pickerController = [[UIImagePickerController alloc] init];
    [pickerController setDelegate:self];
    library = [[ALAssetsLibrary alloc] init];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"info = %@",[info objectForKey:UIImagePickerControllerMediaType]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)pickerViewController:(id)sender
{
    [library saveImage:[UIImage imageNamed:@"9B69D62C-D306-4A69-9D8F-C4FF21D833C3.png"] toAlbum:@"我的照片" withCompletionBlock:nil];
    [self presentViewController:pickerController animated:YES completion:nil];
}
@end
