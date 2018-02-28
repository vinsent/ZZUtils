//
//  UIView+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2018/2/28.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "UIView+ZZExtension.h"

@implementation UIView (ZZExtension)

- (UIViewController*)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)showLoading:(NSString *)word {
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
}

- (void)hideLoading {
    
}

@end
