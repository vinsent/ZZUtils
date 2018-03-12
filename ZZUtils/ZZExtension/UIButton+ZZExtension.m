//
//  UIButton+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIButton+ZZExtension.h"

@implementation UIButton (ZZExtension)

//背景图片绘制
- (void)zz_setBackgroundImageWithColor:(UIColor *)color cornRadius:(CGFloat)cornRadius opaque:(BOOL)isOpaque {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height)];
    view.backgroundColor = color;
    view.layer.cornerRadius = cornRadius;
    
    //第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数是屏幕密度
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, isOpaque, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)zz_setCornerRadius:(CGFloat)cornRadius opaque:(BOOL)isOpaque {
    [self zz_setBackgroundImageWithColor:self.backgroundColor cornRadius:cornRadius opaque:isOpaque];
}

- (void)zz_setCornerRadius:(CGFloat)cornRadius {
    [self zz_setCornerRadius:cornRadius opaque:YES];
}

@end
