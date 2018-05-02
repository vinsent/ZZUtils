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
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV;

/**
 holder font textcolor borderColor
 */
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType borderColor:(UIColor *)borderCol superView:(UIView *)superV;

/**
 holder font textcolor
 */
+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType superView:(UIView *)superV;


/**
 限制textField的输入长度

 使用此方法需先使用addTarget: action:@selector() forControlEvents:UIControlEventValueChanged 调用一个无参fanc, 在调用以传入limitLength
 @param limitLength 限制的长度
 */
- (void)limitTextLength:(int)limitLength;

@end
