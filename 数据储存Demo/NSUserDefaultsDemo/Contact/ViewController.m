//
//  ViewController.m
//  Contact
//
//  Created by Lucifer on 13-4-7.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*NSUserDefaults类用于保存应用程序设置和属性以及用户数据。例如，你可以存储用户在应用程序中使用的图片或默认颜色方案。这些对象存储在iOS所谓的“defaults系统”中。iOS的defaults系统在整个app中都是可用的，因此存放到defaults系统中的数据也是整个应用程序生命周期中可用的。也就是说，无论用户关闭程序还是关机，在用户再次打开程序或开机后这些数据仍然存在。NSUserDefaults可以存储的数据类型包括：
 
 *NSData
 *NSString
 *NSNumber
 *NSDate
 *NSArray
 *NSDictionary
 *如果你想保存其他类型，如UIImage，你应该进行编码（即archive），或者将它转换为NSData、NSNumber或者NSString。
 */
- (void)viewDidLoad
{
    //最终我们要读取刚才存储的数据。
    //由于viewDidLoad方法在程序启动时会调用，我们选择在这个方法中进行。
    
    
    [super viewDidLoad];
    
    //我们调用standardUserDefaults方法获得NSUserDefaults。
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    //我们把Firstname和Last name读到了NSString中。
    
    NSString *firstName = [defaults objectForKey:@"firstName"];
    NSString *lastName = [defaults objectForKey:@"lastName"];
    
    
    
    //由于Age是一个整数，我们把它转变为了字符串——因为我们无法直接把int赋值给TextField的text属性。
    
    int age = [defaults integerForKey:@"age"];
    NSString *ageString = [NSString stringWithFormat:@"%i",age];
    
    
    
    //我们把image对象读入到NSData对象，然后用NSData创建一个UIImage。
    
    NSData *imageData = [defaults dataForKey:@"image"];
    UIImage *contactImage = [UIImage imageWithData:imageData];
    
    
    
    // 我们用读到的数据更新UI控件的显示内容。
    
    firestNameTextField.text = firstName;
    lastNameTextField.text = lastName;
    ageTextField.text = ageString;
    contactImageView.image = contactImage;
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [firestNameTextField release];
    [lastNameTextField release];
    [UITextField release];
    [contactImageView release];
    [firestNameTextField release];
    [firestNameTextField release];
    [lastNameTextField release];
    [ageTextField release];
    [contactImageView release];
    [super dealloc];
}
- (IBAction)save:(id)sender {
    
    //保存文本使用setObject:forKey方法。
    //key用于指定保存的文本的索引键，当你取出数据时用这个索引键去检索它。
    //如果保存整数，使用setInteger:forKey方法。
    //对于图片的保存我们需要创建NSData实例。
    
    
    
    //我们将键盘释放。
    
    [firestNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [ageTextField resignFirstResponder];
    
    
    
    //创建NSString用于临时保存用户输入的Firstname和Last name文本
    
    NSString *firstName = [firestNameTextField text];
    NSString *lastName = [lastNameTextField text];
    
    
    
    //对于用户Age文本，我们用一个int保存。
    
    int age = [[ageTextField text] integerValue];
    
    
    
    //对于contactImageView的image，由于不能直接在NSUserDefaults对象中存放UIImage，我们只能使用NSData来储存
    
    UIImage *contactImage = contactImageView.image;
    NSData *imageData = UIImageJPEGRepresentation(contactImage, 100);
    
    
    
    //我们把数据放入NSUserDefaults对象中
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:firstName forKey:@"firstName"];
    [defaults setObject:lastName forKey:@"lastName"];
    [defaults setInteger:age forKey:@"age"];
    [defaults setObject:imageData forKey:@"image"];
    
    
    
    //我们用synchronize方法把数据持久化到standardUserDefaults数据库。
    
    [defaults synchronize];
    NSLog(@"Data saved");
    
}

- (IBAction)chooseImage:(id)sender
{
    
    //首先，我们创建了一个UIImagePickerController，然后将它的delegate设置为self。
    //然后，我们将“允许用户编辑”属性设置为YES，将UIImagePickerController的源类型设置为照片库。
    //最后，弹出UIImagePickerController。
    
    UIImagePickerController *picker = [[[UIImagePickerController alloc] init]autorelease];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //我们将contactImageView的image属性设置为用户所选择的图片并解散UIImageViewController。
    
    contactImageView.image = [[info objectForKey:UIImagePickerControllerEditedImage] retain];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //解散UIImageViewController
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
