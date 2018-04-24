//
//  UITextField+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2018/4/24.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ZZExtension)


/**
 holder font textcolor corner borderColor
 */
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV;

/**
 holder font textcolor borderColor
 */
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor borderColor:(UIColor *)borderCol superView:(UIView *)superV;

/**
 holder font textcolor
 */
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor superView:(UIView *)superV;

@end
