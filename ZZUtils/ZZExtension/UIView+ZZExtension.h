//
//  UIView+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZExtension)


/**
 获得所属控制器
 */
- (UIViewController*)zz_viewController;


/**
 显示加载菊花
 */
- (void)zz_showLoading:(NSString *)word;
- (void)zz_hideLoading;


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


@end
