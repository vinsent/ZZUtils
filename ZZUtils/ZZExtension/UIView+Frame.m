//
//  UIView+Frame.m
//  ZZUtils
//
//  Created by vint on 2018/4/17.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (CGFloat)x {
  return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
  CGRect dd = self.frame;
  dd.origin.x = x;
  self.frame = dd;
}

- (CGFloat)y {
  return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
  CGRect dd = self.frame;
  dd.origin.y = y;
  self.frame = dd;
}

- (CGFloat)width {
  return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
  CGRect dd = self.frame;
  dd.size.width = width;
  self.frame = dd;
}

- (CGFloat)height {
  return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
  CGRect dd = self.frame;
  dd.size.height = height;
  self.frame = dd;
}


- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color backgroundColor:(UIColor *)backColor {
  
  UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  CGContextSetLineWidth(context, lineWidth);
  CGContextSetStrokeColorWithColor(context, color.CGColor);
  CGContextSetFillColorWithColor(context, backColor.CGColor);
  CGContextMoveToPoint(context, radius, 0);
  
  CGContextAddArcToPoint(context, size.width - radius, 0, size.width, radius, radius);
  CGContextAddArcToPoint(context, size.width, size.height - radius, size.width - radius, size.height, radius);
  CGContextAddArcToPoint(context, radius, size.height, 0, size.height - radius, radius);
  CGContextAddArcToPoint(context, 0, radius, radius, 0, radius);
  
  CGContextDrawPath(context, kCGPathFillStroke);
  UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  UIImageView *imgV = [[UIImageView alloc] initWithImage:output];
  [self insertSubview:imgV atIndex:0];
}

- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color {
  [self zz_setCornerRadius:radius drawSize:size borderWidth:lineWidth borderColor:color backgroundColor:self.backgroundColor];
}

- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderColor:(UIColor *)color {
  [self zz_setCornerRadius:radius drawSize:size borderWidth:1.f borderColor:color];
}

- (void)zz_setCornerRadius:(CGFloat)radius backgroundColor:(UIColor *)color {
  [self zz_setCornerRadius:radius drawSize:self.bounds.size borderWidth:0.01f borderColor:color backgroundColor:color];
}

@end
