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
    UIView *loadingIndicator = [self viewWithTag:1101010];
    if (loadingIndicator && [loadingIndicator isKindOfClass:[UIActivityIndicatorView class]]) {
        [(UIActivityIndicatorView *)loadingIndicator stopAnimating];
    }
    
    UIView *loadingLB = [self viewWithTag:1101001];
    if (loadingLB && [loadingLB isKindOfClass:[UILabel class]]) {
        [loadingLB removeFromSuperview];
    }
}

@end
