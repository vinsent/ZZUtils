//
//  UIImage+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIImage+ZZExtension.h"

@implementation UIImage (ZZExtension)


- (UIImage *)drawRectWithCornerRadius:(CGFloat)radius sizeToFit:(CGSize)imgSize {
    CGRect rect = CGRectMake(0, 0, imgSize.width, imgSize.height);
    
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return output;
}

+ (UIImage *)imageWithColor:(UIColor*) color {
  CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;
}


- (UIImage *)changeWithColor:(UIColor *)color {
  UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextTranslateCTM(context, 0, self.size.height);
  CGContextScaleCTM(context, 1.0, -1.0);
  CGContextSetBlendMode(context, kCGBlendModeNormal);
  CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
  CGContextClipToMask(context, rect, self.CGImage);
  [color setFill];
  CGContextFillRect(context, rect);
  UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}

@end
