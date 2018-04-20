//
//  ApplicationUtil.h
//  ZZUtils
//
//  Created by vint on 2018/4/8.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIApplication.h>

@interface ApplicationUtil : NSObject


/**
 到App系统设置页
 */
+ (void)gotoSettings;

/**
 判断是否开启推送权限

 @param returnBlock 是否已开启
 */
+ (void)openMessageNotificationServiceWithBlock:(void(^)(BOOL isOpen))returnBlock;


/**
 判断是否开启相机权限

 @param isOpenBlock 是否已开启
 */
+ (void)isOpenCamera:(void(^)(BOOL granted))isOpenBlock;


/**
 判断是否开启定位权限

 @return 是否已开启
 */
+ (BOOL)isOpenLocationService;


/**
 调用系统打电话功能

 @param number 手机号码
 */
+ (void)callPhoneWithNumber:(NSString *)number;


/**
 当前设备型号

 @return 型号描述 eg: iPhone X
 */
+ (NSString *)deviceHardwareDescription;

@end
