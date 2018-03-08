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
 button圆角 (设置一张带圆角的纯色图片)

 @param color 背景颜色
 @param cornRadius 圆角半径
 @param isOpaque 是否需要不透明
 */
- (void)zz_setBackgroundImageWithColor:(UIColor *)color cornRadius:(CGFloat)cornRadius opaque:(BOOL)isOpaque;

@end
