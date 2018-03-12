//
//  UIView+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIView+ZZExtension.h"

@implementation UIView (ZZExtension)

- (UIViewController*)zz_viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)zz_showLoading:(NSString *)word {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = word;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    [label sizeToFit];
    [label setCenter: CGPointMake(self.frame.size.width / 2.0 , self.frame.size.height / 2.0)];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(label.frame.origin.x - 20, label.frame.origin.y + 1, 15, 15)];
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [indicator.layer setValue:[NSNumber numberWithFloat:0.7f] forKeyPath:@"transform.scale"];
    [indicator startAnimating];
    
    [self addSubview:label];
    [self addSubview:indicator];
    
    //设置tag, 在hideLoading中根据tag寻找视图
    [label setTag:1101001];
    [indicator setTag:1101010];
}

- (void)zz_hideLoading {
    do {
        UIView *loadingIndicator = [self viewWithTag:1101010];
        if (loadingIndicator && [loadingIndicator isKindOfClass:[UIActivityIndicatorView class]]) {
            [(UIActivityIndicatorView *)loadingIndicator stopAnimating];
            [(UIActivityIndicatorView *)loadingIndicator removeFromSuperview];
        }
        
        UIView *loadingLB = [self viewWithTag:1101001];
        if (loadingLB && [loadingLB isKindOfClass:[UILabel class]]) {
            [loadingLB removeFromSuperview];
        }
        
    } while([self viewWithTag:1101010]);
}

- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color backgroundColor:(UIColor *)backColor {
    
    UIGraphicsBeginImageContextWithOptions(size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, lineWidth);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, backColor.CGColor);
    CGContextMoveToPoint(context, radius, 0);
    
    CGContextAddArcToPoint(context, size.width - radius, 0, size.width, radius, radius);
    CGContextAddArcToPoint(context, size.width, size.height - radius, size.width - radius, size.height, radius);
    CGContextAddArcToPoint(context, radius, size.height, 0, size.height - radius, radius);
    CGContextAddArcToPoint(context, 0, radius, radius, 0, radius);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:output];
    [self insertSubview:imgV atIndex:0];
}

- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderWidth:(CGFloat)lineWidth borderColor:(UIColor *)color {
    [self zz_setCornerRadius:radius drawSize:size borderWidth:lineWidth borderColor:color backgroundColor:self.backgroundColor];
}

- (void)zz_setCornerRadius:(CGFloat)radius drawSize:(CGSize)size borderColor:(UIColor *)color {
    [self zz_setCornerRadius:radius drawSize:size borderWidth:1.f borderColor:color];
}

@end










