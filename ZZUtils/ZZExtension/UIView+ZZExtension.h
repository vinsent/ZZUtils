//
//  UIView+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2018/2/28.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZExtension)


/**
 获得所属控制器
 */
- (UIViewController*)viewController;


/**
 显示加载菊花
 */
- (void)showLoading:(NSString *)word;

@end
