//
//  ApplicationUtil.m
//  ZZUtils
//
//  Created by vint on 2018/4/8.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "ApplicationUtil.h"
#import <UserNotifications/UserNotifications.h>
#import <AVFoundation/AVCaptureDevice.h>

@implementation ApplicationUtil


+ (void)openMessageNotificationServiceWithBlock:(void(^)(BOOL isOpen))returnBlock {
  
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
  if (@available(iOS 10.0, *)) {
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
      if (returnBlock) {
       return returnBlock(settings.authorizationStatus == UNAuthorizationStatusAuthorized);
      }
    }];
  }
#elif __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
  if (returnBlock) {
   return returnBlock([[UIApplication sharedApplication] isRegisteredForRemoteNotifications]);
  }
    
#else
  UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
  if (returnBlock) {
    returnBlock(type != UIRemoteNotificationTypeNone);
  }
#endif
}

+ (void)isOpenCamera:(void(^)(BOOL granted))isOpenBlock {
  AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
  if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
    if (isOpenBlock) {
      isOpenBlock(NO);
    }
  } else if (authStatus == AVAuthorizationStatusNotDetermined) {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
      dispatch_async(dispatch_get_main_queue(), ^{
        if (granted) {
          isOpenBlock(YES);
        } else {
          isOpenBlock(NO);
        }
      });
    }];
  } else {
    isOpenBlock(YES);
  }
}

@end
