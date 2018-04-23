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


@end
