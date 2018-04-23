//
//  UIButton+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZZExtension)


/**
 title font titleColor backgroundColor
 */
+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor superView:(UIView *)superV;


/**
 title font titleColor backgroundColor corner
 */
+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor cornerRadius:(CGFloat)corner superView:(UIView *)superV;


/**
 corner backgroundColor(normal&select) titleColor(normal&select) font title
 */
+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleNormalColor:(UIColor *)titleCol backgroundNormalColor:(UIColor *)backColor titleSelectColor:(UIColor *)selectTitleColor backSelectColor:(UIColor *)selectBackCol cornerRadius:(CGFloat)corner superView:(UIView *)superV;


/**
 corner borderColor backgroundcolor titlecolor font title
 */
+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor borderColor:(UIColor *)borderCol cornerRadius:(CGFloat)corner superView:(UIView *)superV;

- (void)addTarget:(nullable id)target action:(SEL)action;


/**
 设置状态的纯色背景
 */
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;


/**
 设置状态的纯色背景和圆角
 */
- (void)setBackgroundColor:(UIColor *)color cornRadius:(CGFloat)cornRadius forState:(UIControlState)state;

//背景图片绘制
/**
 设置纯色背景和圆角

 @param color 背景颜色
 @param cornRadius 圆角大小
 @param isOpaque 是否需要不透明
 @param state button的状态
 */
- (void)setBackgroundColor:(UIColor *)color cornRadius:(CGFloat)cornRadius opaque:(BOOL)isOpaque forState:(UIControlState)state;

@end
