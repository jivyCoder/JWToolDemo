//
//  NSString+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSInteger, JWCalculationType) {
    JWCalculationTypeForAdd,        //加
    JWCalculationTypeForSubtract,   //减
    JWCalculationTypeForMultiply,   //乘
    JWCalculationTypeForDivide,     //除
};

@interface NSString (Addition)
+ (NSString *)floatOne:(NSString *)floatOne
       JWCalculationType:(JWCalculationType)JWCalculationType
              floatTwo:(NSString *)floatTwo;
/// 是否有表情符号
- (BOOL)jw_containEmoji;

- (NSString *)jw_encodeBase64;

- (NSString *)jw_decodeBase64;
/// 文件大小
- (unsigned long long)jw_fileSize;
/// MD5
- (NSString *)jw_md5Str;
/// 金额
- (BOOL)jw_validateMoney;
/// 给手机号加星
- (NSString *)jw_phoneStarStr;
/// 密码的合法性
- (BOOL)jw_judgePassWordLegal;

- (BOOL)jw_invalidMobile;

- (BOOL)jw_invalidEmail;

- (NSString *)jw_starStringWithRange:(NSRange )range;
/// 时间戳转字符串 
- (NSString *)jw_getDateStringWithTimeStr:(NSString *)str;
@end
