//
//  ViewController.m
//  广告demo
//
//  Created by Jarlen Huang on 16/5/31.
//  Copyright © 2016年 Jarlen Huang. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
@interface ViewController ()
{
    BOOL _isClick;
    UIImageView *_imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    _imageView.image = [UIImage imageNamed:@"6"];
    [self.view addSubview:_imageView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 50)];
    label.text = @"七秒记忆鱼儿注，转注请署名七秒记忆的鱼儿";
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label];
    
#warning 注意  必须盖住
    [self.view bringSubviewToFront:_imageView];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    OneViewController *one = [[OneViewController alloc]init];
    one.myBlock = ^(BOOL isClick){
        _isClick = isClick;
        [_imageView removeFromSuperview];
        _imageView = nil;
    };
    if (_isClick == NO) {
        [self presentViewController:one animated:NO completion:nil];
    }
    
}
@end
