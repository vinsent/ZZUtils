//
//  UIView+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZExtension)

/**
 获得所属控制器
 */
- (UIViewController*)zz_viewController;

/**
 显示加载菊花
 */
- (void)zz_showLoading:(NSString *)word;
- (void)zz_hideLoading;

@end
