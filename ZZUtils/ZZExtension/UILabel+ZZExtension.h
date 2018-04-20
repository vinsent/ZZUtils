//
//  UILabel+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZZExtension)


/**
 fontSize textColor
 */
+ (UILabel *)labelWithFont:(CGFloat)fontSize textColor:(UIColor *)color superView:(UIView *)superView;


/**
 fontSize textColor backgroundColor
 */
+ (UILabel *)labelWithFont: (CGFloat)fontSize textColor: (UIColor *)color backgroundColor: (UIColor *)backgroundColor superView: (UIView *)superView;


/**
 fontSize textColor backgroundColor cornerRadious
 */
+ (UILabel *)labelWithFont: (CGFloat)fontSize textColor: (UIColor *)color backgroundColor: (UIColor *)backgroundColor cornerradious: (CGFloat)corner superView: (UIView *)superView;


/**
 title fontSize textColor
 */
+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color superView:(UIView *)superView;


/**
 title fontSize textColor backgroundColor
 */
+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor superView:(UIView *)superView;


/**
 title font textColor backgroundColor cornerRadious
 */
+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)fontSize textColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor cornerradious:(CGFloat)corner superView:(UIView *)superView;

@end
