//
//  ZZProtocolView.h
//  ZZUtils
//
//  Created by vint on 2018/4/19.
//  Copyright © 2018年 vinsent. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZProtocolView : UITextView

@property(nonatomic,copy) void(^contentTapBlock)(NSInteger index);
@property(nonatomic,copy) NSString *tipString;
@property(nonatomic,copy) NSArray<NSString *> *procolArray;

+ (instancetype)protocolViewWithTip: (NSString *)tipStr Names: (NSArray<NSString *> *)names font: (CGFloat)textFont;

@end
