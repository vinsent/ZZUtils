//
//  UIImageView+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIImageView+ZZExtension.h"
#import "UIImage+ZZExtension.h"

@implementation UIImageView (ZZExtension)

- (void)zz_setCornerRadius:(CGFloat)cornerRadius {
    
    //
    if (self.image) {
        self.image = [self.image drawRectWithCornerRadius:cornerRadius sizeToFit:self.bounds.size];
    }
}

@end
