//
//  NSString+ZZExtension.m
//  ZZUtils
//
//  Created by vint on 2017/2/26.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "NSString+ZZExtension.h"

@implementation NSString (ZZExtension)




@end


@implementation NSAttributedString (ZZExtension)

+(instancetype)attributesStringWith: (NSArray<NSString *> *)texts
                   commonAttributes: (NSDictionary<NSAttributedStringKey, id> *)commonAtt
                  portionAttributes: (NSArray<NSDictionary<NSAttributedStringKey, id> *> *)portionAttArr {
    
    NSMutableAttributedString *mutableAtt = [[NSMutableAttributedString alloc] init];
    
    if (portionAttArr.count == texts.count) {
        [texts enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSAttributedString *att = [[NSAttributedString alloc] initWithString:obj attributes:portionAttArr[idx]];
            
            [mutableAtt appendAttributedString:att];
            
        }];
    } else {
        [texts enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSAttributedString *att = [[NSAttributedString alloc] initWithString:obj];
            
            [mutableAtt appendAttributedString:att];
            
        }];
    }
    
    [mutableAtt addAttributes:commonAtt range:NSMakeRange(0, mutableAtt.length)];
    
    return [mutableAtt copy];
}
@end
