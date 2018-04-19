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


//------------------------------------------数字相关------------------------------------------
/**
 判断纯数字
 */
+ (BOOL)isPureDigits: (NSString *)num;

/**
 判断整数
 */
+ (BOOL)isIntegerNum:(NSString *)num;

/**
 是否为整数或小数
 */
+ (BOOL)isIntegerOrDecimalNum:(NSString *)num;

/**
 判断浮点数
 */
+ (BOOL)isDecimalNum:(NSString *)num;

/**
 判断浮点数(小数部分最多为两位)
 */
+ (BOOL)isTwoDecimalNum:(NSString *)num;


@end
