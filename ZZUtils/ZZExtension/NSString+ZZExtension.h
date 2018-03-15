//
//  NSString+ZZExtension.h
//  ZZUtils
//
//  Created by vint on 2017/2/26.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZZExtension)



@end


@interface NSAttributedString (ZZExtension)


/**
 富文本字符串设置不同部分不同的属性

 @param texts 不同部分的字符串数组
 @param commonAtt 公共富文本属性
 @param portionAttArr 各部分单独属性(与字符串数组对应)
 @return NSAttributedString instance
 */
+(instancetype)attributesStringWith: (NSArray<NSString *> *)texts
                   commonAttributes: (NSDictionary<NSAttributedStringKey, id> *)commonAtt
                  portionAttributes: (NSArray<NSDictionary<NSAttributedStringKey, id> *> *)portionAttArr;

@end
