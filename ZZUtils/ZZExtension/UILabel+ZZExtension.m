//
//  UILabel+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UILabel+ZZExtension.h"

@implementation UILabel (ZZExtension)

+ (UILabel *)labelWithFont:(CGFloat)fontSize textColor:(UIColor *)color superView:(UIView *)superView {
  UILabel *label = [[UILabel alloc] init];
  label.font = [UIFont systemFontOfSize:fontSize];
  label.textColor = color;
  [superView addSubview:label];
  return label;
}

+ (UILabel *)labelWithFont:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView {
  UILabel *label = [self labelWithFont:fontSize textColor:color superView:superView];
  label.backgroundColor = backgroundColor;
  return label;
}

+ (UILabel *)labelWithFont:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor cornerradious:(CGFloat)corner superView: (UIView *)superView {
  UILabel *label = [self labelWithFont:fontSize textColor:color backgroundColor:backgroundColor superView:superView];
  label.layer.cornerRadius = corner;
  label.font = [UIFont systemFontOfSize:12];
  return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color superView:(UIView *)superView {
  UILabel *label = [self labelWithFont:fontSize textColor:color superView:superView];
  label.text = title;
  return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView {
  UILabel *label = [self labelWithTitle:title font:fontSize textColor:color superView:superView];
  label.backgroundColor = backgroundColor;
  return label;
}

+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor cornerradious:(CGFloat)corner superView:(UIView *)superView {
  UILabel *label = [self labelWithTitle:title font:fontSize textColor:color backgroundColor:backgroundColor superView:superView];
  label.layer.cornerRadius = corner;
  return label;
}


@end
