//
//  UIImage+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIImage+ZZExtension.h"

@implementation UIImage (ZZExtension)


- (UIImage *)zz_drawRectWithCornerRadius:(CGFloat)radius sizeToFit:(CGSize)imgSize {
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

@end
