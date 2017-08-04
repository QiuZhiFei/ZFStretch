//
//  ViewController.m
//  ZFStretch
//
//  Created by ZhiFei on 2017/8/4.
//  Copyright © 2017年 ZhiFei. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ZFStretch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIImage *image = [UIImage imageNamed:@"SharePopupWindowImage"];
  UIImage *newImage = [image zf_stretchLeftAndRightWithContainerSize:CGSizeMake(image.size.width * 5, image.size.height)];
  
  UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  imageView.image = newImage;
  imageView.contentMode = UIViewContentModeCenter;
  [self.view addSubview:imageView];
  
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
