//
//  UIBarButtonItem+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/12.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Addition)

+ (instancetype)jw_itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action;

+ (instancetype)jw_itemWithTarget:(id)target action:(SEL)action;

+ (instancetype)jw_itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action;

+ (instancetype)jw_itemWithWhiteTitle:(NSString *)title Target:(id)target action:(SEL)action;

@end
