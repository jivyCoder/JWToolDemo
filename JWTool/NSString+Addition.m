//
//  NSString+Addition.m
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Addition)
+ (NSString *)floatOne:(NSString *)floatOne
       JWCalculationType:(JWCalculationType)JWCalculationType
              floatTwo:(NSString *)floatTwo {
    NSDecimalNumber *_floatOne = [NSDecimalNumber decimalNumberWithString:floatOne];
    NSDecimalNumber *_floatTwo = [NSDecimalNumber decimalNumberWithString:floatTwo];
    NSDecimalNumber *results = nil;
    
    switch (JWCalculationType) {
        case 0: {
            results = [_floatOne decimalNumberByAdding:_floatTwo];
        }
            break;
        case 1: {
            results = [_floatOne decimalNumberBySubtracting:_floatTwo];
        }
            break;
        case 2: {
            results = [_floatOne decimalNumberByMultiplyingBy:_floatTwo];
        }
            break;
        case 3:{
            results = [_floatOne decimalNumberByDividingBy:_floatTwo];
        }
            break;
        default:
            break;
    }
    return results.stringValue;
}
- (BOOL)jw_containEmoji {
    NSUInteger len = [self lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    if (len < 3) {
        return NO;
    }
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bts = (Byte *)[data bytes];
    Byte bt;
    short v;
    for (NSUInteger i = 0; i < len; i++) {
        bt = bts[i];
        if ((bt | 0x7F) == 0x7F) {
            continue;
        }
        if ((bt | 0x1F) == 0xDF) {
            i += 1;
            continue;
        }
        if ((bt | 0x0F) == 0xEF) {
            v = bt & 0x0F;
            v = v << 6;
            v |= bts[i + 1] & 0x3F;
            v = v << 6;
            v |= bts[i + 2] & 0x3F;
            if ([self emojiInSoftBankUnicode:v] || [self emojiInUnicode:v]) {
                return YES;
            }
            i += 2;
            continue;
        }
        if ((bt | 0x3F) == 0xBF) {
            continue;
        }
        return YES;
    }
    return NO;
}
- (BOOL)emojiInSoftBankUnicode:(short)code {
    return ((code >> 8) >= 0xE0 && (code >> 8) <= 0xE5 && (Byte)(code & 0xFF) < 0x60);
}
- (BOOL)emojiInUnicode:(short)code {
    if (code == 0x0023
        || code == 0x002A
        || (code >= 0x0030 && code <= 0x0039)
        || code == 0x00A9
        || code == 0x00AE
        || code == 0x203C
        || code == 0x2049
        || code == 0x2122
        || code == 0x2139
        || (code >= 0x2194 && code <= 0x2199)
        || code == 0x21A9 || code == 0x21AA
        || code == 0x231A || code == 0x231B
        || code == 0x2328
        || code == 0x23CF
        || (code >= 0x23E9 && code <= 0x23F3)
        || (code >= 0x23F8 && code <= 0x23FA)
        || code == 0x24C2
        || code == 0x25AA || code == 0x25AB
        || code == 0x25B6
        || code == 0x25C0
        || (code >= 0x25FB && code <= 0x25FE)
        || (code >= 0x2600 && code <= 0x2604)
        || code == 0x260E
        || code == 0x2611
        || code == 0x2614 || code == 0x2615
        || code == 0x2618
        || code == 0x261D
        || code == 0x2620
        || code == 0x2622 || code == 0x2623
        || code == 0x2626
        || code == 0x262A
        || code == 0x262E || code == 0x262F
        || (code >= 0x2638 && code <= 0x263A)
        || (code >= 0x2648 && code <= 0x2653)
        || code == 0x2660
        || code == 0x2663
        || code == 0x2665 || code == 0x2666
        || code == 0x2668
        || code == 0x267B
        || code == 0x267F
        || (code >= 0x2692 && code <= 0x2694)
        || code == 0x2696 || code == 0x2697
        || code == 0x2699
        || code == 0x269B || code == 0x269C
        || code == 0x26A0 || code == 0x26A1
        || code == 0x26AA || code == 0x26AB
        || code == 0x26B0 || code == 0x26B1
        || code == 0x26BD || code == 0x26BE
        || code == 0x26C4 || code == 0x26C5
        || code == 0x26C8
        || code == 0x26CE
        || code == 0x26CF
        || code == 0x26D1
        || code == 0x26D3 || code == 0x26D4
        || code == 0x26E9 || code == 0x26EA
        || (code >= 0x26F0 && code <= 0x26F5)
        || (code >= 0x26F7 && code <= 0x26FA)
        || code == 0x26FD
        || code == 0x2702
        || code == 0x2705
        || (code >= 0x2708 && code <= 0x270D)
        || code == 0x270F
        || code == 0x2712
        || code == 0x2714
        || code == 0x2716
        || code == 0x271D
        || code == 0x2721
        || code == 0x2728
        || code == 0x2733 || code == 0x2734
        || code == 0x2744
        || code == 0x2747
        || code == 0x274C
        || code == 0x274E
        || (code >= 0x2753 && code <= 0x2755)
        || code == 0x2757
        || code == 0x2763 || code == 0x2764
        || (code >= 0x2795 && code <= 0x2797)
        || code == 0x27A1
        || code == 0x27B0
        || code == 0x27BF
        || code == 0x2934 || code == 0x2935
        || (code >= 0x2B05 && code <= 0x2B07)
        || code == 0x2B1B || code == 0x2B1C
        || code == 0x2B50
        || code == 0x2B55
        || code == 0x3030
        || code == 0x303D
        || code == 0x3297
        || code == 0x3299
        || code == 0x23F0) {
        return YES;
    }
    return NO;
}
- (NSString *)jw_encodeBase64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *stringBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return stringBase64;
}

- (NSString *)jw_decodeBase64 {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self.jw_encodeBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *base64Decoded = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64Decoded;
}

- (NSString *)jw_md5Str{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( original_str, (CC_LONG)strlen(original_str), result );
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

- (unsigned long long)jw_fileSize {
    unsigned long long size = 0;
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&isDirectory];
    if (!exists) return size;
    if (isDirectory) {
        NSDirectoryEnumerator *enumerator = [mgr enumeratorAtPath:self];
        for (NSString *subpath in enumerator) {
            NSString *fullSubpath = [self stringByAppendingPathComponent:subpath];
            size += [mgr attributesOfItemAtPath:fullSubpath error:nil].fileSize;
        }
    }else {
        size = [mgr attributesOfItemAtPath:self error:nil].fileSize;
    }
    
    return size;
}

/** 给手机号加星 */
- (NSString *)jw_phoneStarStr {
    NSString *phone = self;
    if (self.length == 11) {
        phone = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 5) withString:@"*****"];
    }
    return phone;
}
- (BOOL)jw_judgePassWordLegal{
    BOOL result = false;
    if (self.length >= 6){
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:self];
    }
    return result;
}
/// 金额
- (BOOL)jw_validateMoney {
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)jw_invalidMobile {
    NSString *emailRegex = @"^1[3456789]{1}\\d{9}$";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:self];
}
- (BOOL)jw_invalidEmail {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:self];
}

- (NSString *)jw_starStringWithRange:(NSRange )range {
    NSInteger loc = range.location;
    NSInteger length = range.length;
    if (loc > self.length || length > self.length) {
        return self;
    }
    if (length > (self.length - loc)) {
        return self;
    }
    NSMutableString *mutaStr = [[NSMutableString alloc] init];
    for (NSInteger i = 0; i < length; i++) {
        [mutaStr appendString:@"*"];
    }
    
    NSString *star = self;
    star = [star stringByReplacingCharactersInRange:range withString:mutaStr];
    return star;
}

- (NSString *)jw_getDateStringWithTimeStr:(NSString *)str{
    NSTimeInterval time=[str doubleValue];
    NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
    return currentDateStr;
}
@end
