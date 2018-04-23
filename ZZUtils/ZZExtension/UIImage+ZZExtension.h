//
//  UIImage+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZZExtension)


/**
 剪切圆角图片

 @param radius 圆角半径
 @param imgSize 需要剪切区域
 @return 剪切后图片
 */
- (UIImage *)drawRectWithCornerRadius:(CGFloat)radius sizeToFit:(CGSize)imgSize;


/**
 绘制纯色图片

 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor*) color;


/**
 改变图片色调

 @param color 颜色
 @return 图片
 */
- (UIImage *)changeWithColor:(UIColor *)color;

@end
