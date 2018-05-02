//
//  UITextField+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2018/4/24.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "UITextField+ZZExtension.h"

@implementation UITextField (ZZExtension)

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  if (self = [super initWithFrame:CGRectZero]) {
    
    self.placeholder = placeHolder;
    self.font = [UIFont systemFontOfSize:textFont];
    self.textColor = textColor;
    self.layer.cornerRadius = corner;
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = borderCol.CGColor;
    self.keyboardType = keyBoardType;
    
    [superV addSubview:self];
  }
  return self;
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType cornerRadius:(CGFloat)corner borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor keyBoardType:keyBoardType cornerRadius:corner borderColor:borderCol superView:superV];
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType borderColor:(UIColor *)borderCol superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor keyBoardType:keyBoardType cornerRadius:0 borderColor:borderCol superView:superV];
}

+ (instancetype)textFieldWithPlaceHolder:(NSString *)placeHolder font:(CGFloat)textFont textColor:(UIColor *)textColor keyBoardType:(UIKeyboardType)keyBoardType superView:(UIView *)superV {
  return [[self alloc] initWithPlaceHolder:placeHolder font:textFont textColor:textColor keyBoardType:keyBoardType cornerRadius:0 borderColor:[UIColor clearColor] superView:superV];
}

- (void)limitTextLength:(int)limitLength {

  NSString *languageDes = [self.textInputMode primaryLanguage];
  if ([languageDes isEqualToString:@"zh-Hans"]) {
    
    if (!self.markedTextRange) {
      
      if (self.text.length > limitLength) {
        
        NSRange limitRange = NSMakeRange(0, limitLength);
        self.text = [self.text substringWithRange:limitRange];
      }
    }
  } else {
    
    if (self.text.length > limitLength) {
      
      NSRange limitRange = NSMakeRange(0, limitLength);
      self.text = [self.text substringWithRange:limitRange];
    }
  }
}

@end
