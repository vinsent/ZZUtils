//
//  UIButton+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/28.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "UIButton+ZZExtension.h"

@implementation UIButton (ZZExtension)

+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor superView:(UIView *)superV {
  return [[self alloc] initWithTitle:title textFont:font titleNormalColor:titleCol backgroundNormalColor:backColor titleSelectColor:titleCol backSelectColor:backColor cornerRadius:0 superView:superV];
}

+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor cornerRadius:(CGFloat)corner superView:(UIView *)superV {
  return [[self alloc] initWithTitle:title textFont:font titleNormalColor:titleCol backgroundNormalColor:backColor titleSelectColor:titleCol backSelectColor:backColor cornerRadius:corner superView:superV];
}

+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleNormalColor:(UIColor *)titleCol backgroundNormalColor:(UIColor *)backColor titleSelectColor:(UIColor *)selectTitleColor backSelectColor:(UIColor *)selectBackCol cornerRadius:(CGFloat)corner superView:(UIView *)superV {
  return [[self alloc] initWithTitle:title textFont:font titleNormalColor:titleCol backgroundNormalColor:backColor titleSelectColor:selectTitleColor backSelectColor:selectBackCol cornerRadius:corner superView:superV];
}

- (instancetype)initWithTitle:(NSString *)title textFont:(CGFloat)font titleNormalColor:(UIColor *)titleCol backgroundNormalColor:(UIColor *)backColor titleSelectColor:(UIColor *)selectTitleColor backSelectColor:(UIColor *)selectBackCol cornerRadius:(CGFloat)corner superView:(UIView *)superV {
  if (self = [super initWithFrame:CGRectZero]) {
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:font];
    [self setTitleColor:titleCol forState:UIControlStateNormal];
    [self setTitleColor:selectTitleColor forState:UIControlStateSelected];
    [self setBackgroundColor:backColor cornRadius:corner opaque:YES forState:UIControlStateNormal];
    [self setBackgroundColor:selectBackCol cornRadius:corner opaque:YES forState:UIControlStateSelected];
    
    [superV addSubview:self];
  }
  return self;
}


+ (instancetype)buttonWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor borderColor:(UIColor *)borderCol cornerRadius:(CGFloat)corner superView:(UIView *)superV {
  return [[self alloc] initWithTitle:title textFont:font titleColor:titleCol backgroundColor:backColor borderColor:borderCol cornerRadius:corner superView:superV];
}

- (instancetype)initWithTitle:(NSString *)title textFont:(CGFloat)font titleColor:(UIColor *)titleCol backgroundColor:(UIColor *)backColor borderColor:(UIColor *)borderCol cornerRadius:(CGFloat)corner superView:(UIView *)superV {
  if (self = [super initWithFrame:CGRectZero]) {
    [self setTitle:title forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:font];
    [self setTitleColor:titleCol forState:UIControlStateNormal];
    [self setBackgroundColor:backColor cornRadius:corner opaque:YES forState:UIControlStateNormal];
    
    self.layer.borderColor = borderCol.CGColor;
    self.layer.borderWidth = 1.f;
    
    [superV addSubview:self];
  }
  return self;
}

- (void)addTarget:(nullable id)target action:(SEL)action {
  [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

//背景图片绘制
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
  [self setBackgroundColor:color cornRadius:0 opaque:YES forState:state];
}

- (void)setBackgroundColor:(UIColor *)color cornRadius:(CGFloat)cornRadius forState:(UIControlState)state {
  [self setBackgroundColor:color cornRadius:cornRadius opaque:YES forState:UIControlStateNormal];
}

//背景图片绘制
- (void)setBackgroundColor:(UIColor *)color cornRadius:(CGFloat)cornRadius opaque:(BOOL)isOpaque forState:(UIControlState)state {
  UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.bounds.size.width, self.bounds.size.height)];
  view.backgroundColor = color;
  view.layer.cornerRadius = cornRadius;
  
  //第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数是屏幕密度
  UIGraphicsBeginImageContextWithOptions(view.bounds.size, isOpaque, [UIScreen mainScreen].scale);
  [view.layer renderInContext:UIGraphicsGetCurrentContext()];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [self setBackgroundImage:image forState:state];
}

@end
