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
#import <sys/sysctl.h>

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

+ (BOOL)isOpenLocationService {
  BOOL bOpenLocation;
  CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
  if (![CLLocationManager locationServicesEnabled] || status == kCLAuthorizationStatusRestricted || status == kCLAuthorizationStatusDenied) {
    bOpenLocation = NO;
  } else {
    bOpenLocation = YES;
  }
  return bOpenLocation;
}

+ (void)callPhoneWithNumber:(NSString *)number {
  
  NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",number]];
  if (@available(iOS 10.0, *)) {
    
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) { }];
  } else {
    
    [[UIApplication sharedApplication] openURL:url];
  }
  
}

+ (NSString *)deviceHardwareDescription {
  
  size_t size;
  sysctlbyname("hw.machine", NULL, &size, NULL, 0);
  char *machine = malloc(size);
  sysctlbyname("hw.machine", machine, &size, NULL, 0);
  NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
  free(machine);

  //iPhone
  if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
  if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
  if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
  if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
  if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4V";
  if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
  if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
  if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
  if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
  if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
  if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
  if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
  if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
  if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 plus";
  if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
  if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
  if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
  if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
  if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
  if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
  if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
  if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
  if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
  if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";
  if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
  if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
  if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";
  
  //iPod Touch
  if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
  if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
  if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
  if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
  if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
  if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
  
  //iPad
  if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
  if ([platform isEqualToString:@"iPad2,1"])      return @"iPad2 Wifi";
  if ([platform isEqualToString:@"iPad2,2"])      return @"iPad2 GSM 3G";
  if ([platform isEqualToString:@"iPad2,3"])      return @"iPad2 CDMA 3G";
  if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (Wifi)";
  if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
  if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
  if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (Wifi)";
  if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
  if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
  if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (Wifi)";
  if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
  if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
  if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (Wifi)";
  if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (GSM)";
  if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (CDMA)";
  if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (Wifi)";
  if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
  if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (Cellular)";
  if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (Wifi)";
  if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
  if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (Cellular)";
  if ([platform isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (Wifi)";
  if ([platform isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (Cellular)";
  if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (Wifi)";
  if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
  if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7-inch (WiFi)";
  if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7-inch (Cellular)";
  if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9-inch (WiFi)";
  if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9-inch (Cellular)";
  if ([platform isEqualToString:@"iPad6,11"])     return @"iPad 5 (WiFi)";
  if ([platform isEqualToString:@"iPad6,12"])     return @"iPad 5 (Cellular)";
  if ([platform isEqualToString:@"iPad7,1"])      return @"iPad Pro 12.9-inch (WiFi)";
  if ([platform isEqualToString:@"iPad7,2"])      return @"iPad Pro 12.9-inch (Cellular)";
  if ([platform isEqualToString:@"iPad7,3"])      return @"iPad Pro 10.5-inch (WiFi)";
  if ([platform isEqualToString:@"iPad7,4"])      return @"iPad Pro 10.5-inch (Cellular)";
  
  //Apple Watch
  if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch";
  if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch";
  
  //simulator
  if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])         return [UIDevice currentDevice].model;
  
  return platform;
}

@end
