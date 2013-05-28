//
//  ViewController.m
//  各种手势
//
//  Created by Ibokan on 12-11-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController
int a=0;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    UIView* myView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,320, 460)];
//    [myView setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:myView];
    [self.view setBackgroundColor:[UIColor blueColor]];//与上句等价
    
    [self addSlide];//添加滑条
    [self addImageView];//添加图片
    [self addButton];//添加按钮
    //[self loadGesture];//添加单击手势
}

-(void)addSlide//添加滑动条
{
    slider=[[UISlider alloc]initWithFrame:CGRectMake(85,20, 150, 30)];
    slider.minimumValue=0.00001;
    slider.maximumValue=3;
    //slider.value=0.5;
    slider.alpha=10;   //透明度
    [slider addTarget:self action:@selector(add:) forControlEvents:UIControlEventValueChanged];
  
    [self.view addSubview:slider];
}
-(void)add:(id)sender//滑调作用
{
    if(a==0)
    {
        _imageView.animationDuration= [(UISlider *)sender value];
        [_imageView stopAnimating];
        [_imageView startAnimating];
    }
    

    
        
}




-(void)addImageView//添加图片
{
    UIImage* image=[UIImage imageNamed:@"h1.jpeg"];
    float width=image.size.width/3;
    float height=image.size.height/3;
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake((320-width)/2, (460-height)/2-40, width, height)];
    [_imageView setImage:image];
    [_imageView setUserInteractionEnabled:YES];
    [self.view addSubview:_imageView];
}
-(void)addButton//添加按键
{
    UIButton* startbutton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [startbutton setFrame:CGRectMake(65, 360,80, 30)];
    [startbutton setTitle:@"播放动画" forState:UIControlStateNormal];
    [startbutton addTarget:self action:@selector(startAni:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startbutton];
    
    UIButton* stopButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [stopButton setFrame:CGRectMake(175, 360, 80, 30)];
    [stopButton setTitle:@"停止播放" forState:UIControlStateNormal];
    [stopButton addTarget:self action:@selector(stopAni:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopButton];
    
    NSArray* array=[[NSArray alloc]initWithObjects:@"单击",@"双击",@"捏合",@"拖拽",@"轻扫",@"旋转", nil];
    UISegmentedControl* segmentedCotrol=[[UISegmentedControl alloc]initWithItems:array];
    [segmentedCotrol setFrame:CGRectMake(0, 460-40,320,40)];
    
    [segmentedCotrol addTarget:self action:@selector(loadGesture:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedCotrol];
    [array release];
    [segmentedCotrol release];
}
-(void)loadGesture:(id)sender
{
    for (UIGestureRecognizer* ges in _imageView.gestureRecognizers) 
    {
        [_imageView removeGestureRecognizer:ges];
    }
    UISegmentedControl* seg=(UISegmentedControl*)sender;
    if(seg.selectedSegmentIndex==0) 
    {
        //单击
        UITapGestureRecognizer* singleTap=[[UITapGestureRecognizer alloc]init];//初始化一个手势   （GestureRecognizer）：手势辨识器
        [singleTap addTarget:self action:@selector(singleTaped:)];
        [_imageView addGestureRecognizer:singleTap];//添加响应方法（加到识别器队列中)   
        //[singleTap requireGestureRecognizerToFail:doubleTap];//监听
        [singleTap release];
    }else if(seg.selectedSegmentIndex==1)//单击    
    {
        
        UITapGestureRecognizer* doubleTap=[[UITapGestureRecognizer alloc]init];
        doubleTap.numberOfTapsRequired=2;
        [doubleTap addTarget:self action:@selector(doubleTaped:)];
        [_imageView addGestureRecognizer:doubleTap];
        [doubleTap release];
    }else if(seg.selectedSegmentIndex==2)//双击    
    {
        //捏合
        UIPinchGestureRecognizer* pinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinched:)];
        [_imageView addGestureRecognizer:pinch];
        [pinch release];
    }else if(seg.selectedSegmentIndex==3)//捏合
    {
        //拖拽
        UIPanGestureRecognizer* pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(paned:)];
        [_imageView addGestureRecognizer:pan];
        [pan release];
    }else if(seg.selectedSegmentIndex==4)//拖拽
    {
        //轻扫
        UISwipeGestureRecognizer* swip=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiped:)];
        swip.direction=UISwipeGestureRecognizerDirectionRight|UISwipeGestureRecognizerDirectionLeft;
        [_imageView addGestureRecognizer:swip];
        [swip release];
    }else if(seg.selectedSegmentIndex==5)//轻扫   
    {
        //旋转
        UIRotationGestureRecognizer* pota=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(potaed:)];
        [_imageView addGestureRecognizer:pota];
        [pota release];  
    }
}


-(void)doubleTaped:(id)sender//双击
{
    NSLog(@"双击手势");
    [self changeImageViewImage];
}
-(void)singleTaped:(id)sender//单击
{
    NSLog(@"单击手势");
    [self changeImageViewImage];    
}
-(void)changeImageViewImage//改变图片
{
    UIImage* image=[UIImage imageNamed:[NSString stringWithFormat:@"h%d.jpeg",arc4random()%8+1]];//随机抽取
    [_imageView setImage:image];
}
-(void)pinched:(id)sender//捏合
{
    UIPinchGestureRecognizer* pinch=(UIPinchGestureRecognizer*)sender;//(强转)
    _imageView.transform=CGAffineTransformMakeScale(pinch.scale, pinch.scale);    
}
-(void)paned:(id)sender//拖拽
{
    UIPanGestureRecognizer* pan=(UIPanGestureRecognizer*)sender;
    
    
    if (pan.state==UIGestureRecognizerStateBegan)//一次拖拽的开始
    {
        _oldPoint=[pan locationInView:self.view];
        _newPoint=[pan locationInView:self.view];
       // NSLog(@"%f %f",startPoint.x,startPoint.y);
    }
    _oldPoint=_newPoint;
    _newPoint=[pan locationInView:self.view];
    float deltaX =_newPoint.x-_oldPoint.x;
    float deltaY =_newPoint.y-_oldPoint.y;
   // NSLog(@"%f  %f",deltaX,deltaY);
    CGRect rc=CGRectMake(_imageView.frame.origin.x+deltaX, _imageView.frame.origin.y+deltaY, _imageView.frame.size.width,_imageView.frame.size.height);
    [_imageView setFrame:rc];
}
-(void)swiped:(id)sender//轻扫
{
    UISwipeGestureRecognizer* swipe=(UISwipeGestureRecognizer*)sender;
    if(swipe.direction==UISwipeGestureRecognizerDirectionRight)
    {
        [self changeImageViewImage];
    }
    else
    {
        [self changeImageViewImage];
    }
}
-(void)potaed:(id)sender//旋转
{
    UIRotationGestureRecognizer* pota=(UIRotationGestureRecognizer*)sender;
    _imageView.transform=CGAffineTransformMakeRotation(pota.rotation);
}



//动画
-(void)startAni:(id)sender//动画开始
{
    if([_imageView isAnimating])
    {
        return;
    }
    NSMutableArray* pictures=[[NSMutableArray alloc]initWithCapacity:10];
    for (int i =1; i<=6; i++)
    {
        NSString* name=[NSString stringWithFormat:@"run%d.tiff",i];
        UIImage* image=[UIImage imageNamed:name];
        [pictures addObject:image];
        
    }
    _imageView.animationImages=pictures;
    [pictures release];
    _imageView.animationDuration=slider.value;
    [_imageView startAnimating];
    a=0;
    
}
-(void)stopAni:(id)sender
{

    [_imageView stopAnimating];
    a=1;
}



    



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
