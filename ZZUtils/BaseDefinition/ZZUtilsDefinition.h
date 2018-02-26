//
//  ZZUtilsDefinition.h
//  ZZUtils
//
//  Created by vint on 2017/2/12.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#ifndef ZZUtilsDefinition_h
#define ZZUtilsDefinition_h

#ifdef DEBUG
#define NSLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#else
#define NSLog(format, ...)
#endif

//Log当前函数信息
#ifdef DEBUG
#define Log(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define Log(...)
#endif

//强弱指针转换 配套使用
#define Weak(obj) autoreleasepool{} __weak typeof(obj) z##obj = obj;
#define Strong(obj) autoreleasepool{} __strong typeof(obj) obj = z##obj;

//获取屏幕 宽度、高度
#define SCREEN_WIDTH                                  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                                 ([UIScreen mainScreen].bounds.size.height)
#define WIDTHRADIUS                                   (SCREEN_WIDTH / 375.0)
#define HEIGHTRADIUS                                  (SCREEN_HEIGHT / 667.0)

//----------------------系统----------------------------
//获取应用名称
#define APP_NAME                                      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//当前系统版本
#define Current_system_version                        [[UIDevice currentDevice] systemVersion]
#define Current_system_version_float                  [[[UIDevice currentDevice] systemVersion] floatValue]

//当前应用的版本号
#define Current_app_version                           [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//当前应用的内建版本号
#define Current_app_build                             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

//获取当前语言
#define Current_system_language                       ([[NSLocale preferredLanguages] objectAtIndex:0])

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//系统主要单例
#define UserDefaults                                  [NSUserDefaults standardUserDefaults]
#define NotificationCenter                            [NSNotificationCenter defaultCenter]
#define SharedApplication                             [UIApplication sharedApplication]
#define MainBundle                                    [NSBundle mainBundle]
#define MainScreen                                    [UIScreen mainScreen]
//Application delegate
#define ApplicationDelegate                           ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//网络指示
#define ShowNetworkActivityIndicator                  [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator                  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO

//定义UIImage对象
#define ImageNamed(Name)                              [UIImage imageNamed:Name]
#define ImageOfFile(fileName)                         [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil]]

//----------------------颜色---------------------------
#define ColorFromHex(hexValue)                        [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]
#define ColorFromHex(hexValue, alph)                  [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alph]
#define ColorFromRGB(r,g,b)                           [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define ColorFromRGB(r,g,b,a)                         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//----------------------字体---------------------------
#define FONT_SYSTEM(f)                                [UIFont systemFontOfSize:f]
#define FONT_SYSTEM_B(f)                              [UIFont boldSystemFontOfSize:f]
/*方正黑体*/
#define FONT_FZ(F)                                    [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]
/*微软雅黑*/
#define FONT_YH(F)                                    [UIFont fontWithName:@"MicrosoftYaHei" size:F]
/*微软雅黑(加粗)*/
#define FONT_YH_B(F)                                  [UIFont fontWithName:@"MicrosoftYaHei-Bold" size:F]

//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//获取字典的key对应的String value
#define DSStringValue(x) x == nil?@"":x

//单例化一个类
#define SINGLETON_FOR_CLASS(classname) \
static classname *instance##classname = nil; \
\
+ (classname *)shared##classname { \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance##classname = [[classname alloc] init];\
});\
return instance##classname; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance##classname = [super allocWithZone:zone];\
});\
return instance##classname;\
}

#endif /* ZZUtilsDefinition_h */
