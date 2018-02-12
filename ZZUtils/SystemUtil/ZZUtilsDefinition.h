//
//  ZZUtilsDefinition.h
//  ZZUtils
//
//  Created by vint on 2017/2/12.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#ifndef ZZUtilsDefinition_h
#define ZZUtilsDefinition_h

#ifdef DEBUG
#define NSLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#else
#define NSLog(format, ...)
#endif

//强弱指针转换 配套使用
#define Weak(obj) autoreleasepool{} __weak typeof(obj) z##obj = obj;
#define Strong(obj) autoreleasepool{} __strong typeof(obj) obj = z##obj;


#endif /* ZZUtilsDefinition_h */
