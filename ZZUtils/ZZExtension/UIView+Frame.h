//
//  UIView+Frame.h
//  ZZUtils
//
//  Created by vint on 2018/4/17.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

/**
 设置圆角
 
 @param radius 圆角半径
 @param size 绘制区域
 @param lineWidth 边线宽度
 @param color 边线颜色
 @param backColor background color
 */
- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color backgroundColor:(UIColor *)backColor;
- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color;
- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderColor:(UIColor *)color;
- (void)zz_setCornerRadius:(CGFloat)radius backgroundColor:(UIColor *)color;

@end
