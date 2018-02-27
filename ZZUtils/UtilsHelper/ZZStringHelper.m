//
//  ZZStringHelper.m
//  ZZUtils
//
//  Created by vint on 2017/2/26.
//  Copyright © 2017年 vinsent. All rights reserved.
//

#import "ZZStringHelper.h"

@implementation ZZStringHelper

+ (BOOL)isEmptyString:(NSString *)str {
    if (!str || !str.length) {
        return YES;
    }
    
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [str stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}

+ (BOOL)isPhoneNumber:(NSString *)numStr {
    if ([self isEmptyString:numStr]) {
        return NO;
    }

    //判断是否为以数字 1 开头的11位数字
    NSString *phoneRegex = @"^1([0-9])\\d{9}$";
    NSPredicate *phonePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phonePredicate evaluateWithObject:numStr];
}

+ (BOOL)isIdentityCard: (NSString *)identityCardNum {
    if ([self isEmptyString:identityCardNum]) {
        return NO;
    }
    
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate  predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCardNum];
}

+ (BOOL)isValidateEmail:(NSString *)email {
    if ([self isEmptyString:email]) {
        return NO;
    }
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


+ (BOOL)isPureDigits: (NSString *)num {
    NSString *pointNum = @"^\\d+$";
    
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pointNum];
    
    if ([numPredicate evaluateWithObject:num] == YES) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isIntegerNum:(NSString *)num {
    NSString *pointNum = @"^[1-9]{1}\\d+$";
    
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pointNum];
    
    if ([numPredicate evaluateWithObject:num] == YES) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isIntegerOrDecimalNum:(NSString *)num {
    NSString *pointNum = @"(^[0-9]+([.]{1}[0-9]+){0,1}$)";
    
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pointNum];
    
    if ([numPredicate evaluateWithObject:num] == YES) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isDecimalNum:(NSString *)num {
    NSString *pointNum = @"(^[1-9]{1}[0-9]+([.]{1}[0-9]+){1}$)";
    
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pointNum];
    
    if ([numPredicate evaluateWithObject:num] == YES) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)isTwoDecimalNum:(NSString *)num {
    NSString *pointNum = @"(^[1-9]{1}[0-9]+([.]{1}([0-9]{1,2})){1}$)";
    
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pointNum];
    
    if ([numPredicate evaluateWithObject:num] == YES) {
        return YES;
    }
    
    return NO;
}

@end











