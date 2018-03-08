//
//  UIImageView+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZZExtension)


/**
 设置圆角 (必须先设置image)

 @param cornerRadius 圆角半径
 */
- (void)zz_setCornerRadius:(CGFloat)cornerRadius;

@end
