//
//  UIColor+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.eallaince All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)jw_colorWithHexString:(NSString *)color;

+ (UIColor *)jw_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
