//
//  ZZStringHelper.h
//  ZZUtils
//
//  Created by vint on 2017/2/26.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZStringHelper : NSObject


/**
 判断字符串是否为空
 */
+ (BOOL)isEmptyString:(NSString *)str;

/**
 判断是否为手机号码
 */
+ (BOOL)isPhoneNumber:(NSString *)numStr;


/**
 是否为身份证号码
 */
+ (BOOL)isIdentityCard: (NSString *)identityCardNum;


/**
 邮箱地址格式是否有效
 */
+ (BOOL)isValidateEmail:(NSString *)email;


@end
