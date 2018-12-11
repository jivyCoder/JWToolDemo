//
//  UIView+Addition.h
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)
@property (nonatomic, assign) CGSize jw_size;
@property (nonatomic, assign) CGFloat jw_width;
@property (nonatomic, assign) CGFloat jw_height;
@property (nonatomic, assign) CGFloat jw_x;
@property (nonatomic, assign) CGFloat jw_y;
@property (nonatomic, assign) CGFloat jw_centerX;
@property (nonatomic, assign) CGFloat jw_centerY;
@property (nonatomic, assign) CGFloat jw_right;
@property (nonatomic, assign) CGFloat jw_bottom;
@property (nonatomic, assign) CGPoint jw_origin;
@property (nonatomic, assign) CGFloat jw_maxX;
/// 圆角
- (void)jw_byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
@end
