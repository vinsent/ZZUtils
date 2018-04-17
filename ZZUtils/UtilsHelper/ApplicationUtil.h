//
//  ApplicationUtil.h
//  ZZUtils
//
//  Created by vint on 2018/4/8.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationUtil : NSObject


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

@end
