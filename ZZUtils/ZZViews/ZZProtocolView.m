//
//  ZZProtocolView.m
//  ZZUtils
//
//  Created by vint on 2018/4/19.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import "ZZProtocolView.h"

@implementation ZZProtocolView

+ (instancetype)protocolViewWithTip: (NSString *)tipStr Names: (NSArray<NSString *> *)names font: (CGFloat)textFont {
  ZZProtocolView *vv = [[ZZProtocolView alloc] init];
  vv.tipString = tipStr;
  vv.procolArray = names;
  vv.font = [UIFont systemFontOfSize:textFont];
  vv.backgroundColor = [UIColor clearColor];
  [vv setEditable:NO];
  return vv;
}

- (void)setProcolArray:(NSArray<NSString *> *)procolArray {
  _procolArray = procolArray;
  
  NSMutableAttributedString *mutAtt = [[NSMutableAttributedString alloc] initWithString:self.tipString attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
  
  for (NSString *name in procolArray) {
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:name attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}];
    NSAttributedString *midAtt = [[NSAttributedString alloc] initWithString:@"," attributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    [mutAtt appendAttributedString:att];
    [mutAtt appendAttributedString:midAtt];
  }
  [mutAtt deleteCharactersInRange:NSMakeRange(mutAtt.length - 1, 1)];
  self.attributedText = [mutAtt copy];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  [super touchesBegan:touches withEvent:event];
  
  
  UITouch *touch = [touches anyObject];
  CGPoint touchPoint = [touch locationInView:self];
  
  UITextRange *touchRange = [self characterRangeAtPoint:touchPoint];
  
  NSInteger startLocation = [self offsetFromPosition:self.beginningOfDocument toPosition:touchRange.start];
  
  [self.procolArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    NSRange nameRange = [self.text rangeOfString:obj];
    if ((nameRange.location <= startLocation) && (nameRange.location + nameRange.length >= startLocation)) {
      //
      if (self.contentTapBlock) {
        self.contentTapBlock(idx);
        return;
      }
    }
  }];
  
}
@end
