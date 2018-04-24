//
//  UITextField+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2018/4/24.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "UITextField+ZZExtension.h"

@implementation UITextField (ZZExtension)

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  if (self = [super initWithFrame:CGRectZero]) {
    
    self.placeholder = placeHolder;
    self.font = [UIFont systemFontOfSize:textFont];
    self.textColor = textColor;
    self.layer.cornerRadius = corner;
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = borderCol.CGColor;
    
    [superV addSubview:self];
  }
  return self;
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor cornerRadius:corner borderColor:borderCol superView:superV];
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor cornerRadius:0 borderColor:borderCol superView:superV];
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor cornerRadius:0 borderColor:[UIColor clearColor] superView:superV];
}

@end
