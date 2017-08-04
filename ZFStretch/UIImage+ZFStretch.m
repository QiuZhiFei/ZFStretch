//
//  UIImage+ZFStretch.m
//  Bugly
//
//  Created by ZhiFei on 2017/8/4.
//  Copyright © 2017年 ZhiFei. All rights reserved.
//

#import "UIImage+ZFStretch.h"

@implementation UIImage (ZFStretch)

- (nullable UIImage *)zf_stretchLeftAndRightWithContainerSize:(CGSize)size
{
  UIImage *resultImage = [self _getStretchRightImageWithContainerSize:size];
  resultImage = [resultImage _getStretchLeftImageWithContainerSize:size];
  return resultImage;
}

- (nullable UIImage *)_getStretchRightImageWithContainerSize:(CGSize)size
{
  CGSize imageSize = self.size;
  CGSize bgSize = size;
  UIImage *image = [self stretchableImageWithLeftCapWidth:imageSize.width *0.8 topCapHeight:imageSize.height * 0.5];
  CGFloat tempWidth = (bgSize.width)/2 + imageSize.width/2;
  UIGraphicsBeginImageContextWithOptions(CGSizeMake(tempWidth, imageSize.height), NO, [UIScreen mainScreen].scale);
  [image drawInRect:CGRectMake(0, 0, tempWidth, bgSize.height)];
  
  UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return resultImage;
}

- (nullable UIImage *)_getStretchLeftImageWithContainerSize:(CGSize)size
{
  UIImage *image = [self stretchableImageWithLeftCapWidth:self.size.width *0.1 topCapHeight:self.size.height*0.5];
  UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
  [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
  
  UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return resultImage;
}

@end
