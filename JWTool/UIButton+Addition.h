//
//  UIButton+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, JWButtonEdgeInsetsStyle) {
    JWButtonEdgeInsetsStyleTop, // image在上，label在下
    JWButtonEdgeInsetsStyleLeft, // image在左，label在右
    JWButtonEdgeInsetsStyleBottom, // image在下，label在上
    JWButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Addition)

+ (instancetype)jw_buttonWithImage:(NSString *)image highImage:(NSString *)highImage  title:(NSString *)title target:(id)target action:(SEL)action;
+ (instancetype)jw_buttonWithTitle:(NSString *)title Target:(id)target action:(SEL)action;

- (void)jw_layoutButtonWithEdgeInsetsStyle:(JWButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
