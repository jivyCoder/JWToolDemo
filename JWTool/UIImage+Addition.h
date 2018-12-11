//
//  UIImage+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/8.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Addition)
- (NSString *_Nullable)jw_base64Image;
- (UIImage *_Nullable)jw_dencode:(NSString *_Nullable)base64String;
/** 返回圆形图片 */
- (instancetype _Nullable)jw_circleImage;
+ (instancetype _Nullable)jw_circleImage:(NSString *_Nullable)name;
- (instancetype _Nullable)jw_waterMarkImageName:(NSString *_Nullable)markName;
- (UIImage *_Nullable)jw_compressWithSize:(CGSize)limitSize;
+ (UIImage *_Nullable)jw_imageWithColor:(UIColor *_Nullable)color;
- (UIImage *_Nullable)jw_imageWithAlpha:(CGFloat)alpha image:(UIImage*_Nullable)image;
+ (UIImage *_Nullable)jw_imageWithAlpha:(CGFloat)alpha image:(UIImage*_Nullable)image;
@end
