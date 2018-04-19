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
#import <CoreLocation/CoreLocation.h>

@implementation ApplicationUtil


+ (void)gotoSettings {
  
  if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]]) {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
  }
}

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

- (BOOL)isOpenLocationService {
  BOOL bOpenLocation;
  CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
  if (![CLLocationManager locationServicesEnabled] || status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
    bOpenLocation = NO;
  } else {
    bOpenLocation = YES;
  }
  return bOpenLocation;
}

- (void)callPhoneWithNumber:(NSString *)number {
  
  NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]];
  if (@available(iOS 10.0, *)) {
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) { }];
  } else {
    
    [[UIApplication sharedApplication] openURL:url];
  }
  
}

@end
