//
//  UIView+Addition.m
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

/// size
- (void)setJw_size:(CGSize)jw_size {
    CGRect frame = self.frame;
    frame.size = jw_size;
    self.frame = frame;
}
- (CGSize)jw_size {
    return self.frame.size;
}

/// width
- (void)setJw_width:(CGFloat)jw_width {
    CGRect frame = self.frame;
    frame.size.width = jw_width;
    self.frame = frame;
}
- (CGFloat)jw_width {
    return self.frame.size.width;
}

/// height
- (void)setJw_height:(CGFloat)jw_height {
    CGRect frame = self.frame;
    frame.size.height = jw_height;
    self.frame = frame;
}
- (CGFloat)jw_height {
    return self.frame.size.height;
}

/// x
- (void)setJw_x:(CGFloat)jw_x {
    CGRect frame = self.frame;
    frame.origin.x = jw_x;
    self.frame = frame;
}
- (CGFloat)jw_x {
    return self.frame.origin.x;
}

/// y
- (void)setJw_y:(CGFloat)jw_y{
    CGRect frame = self.frame;
    frame.origin.y = jw_y;
    self.frame = frame;
}
- (CGFloat)jw_y {
    return self.frame.origin.y;
}

/// centerX
- (void)setJw_centerX:(CGFloat)jw_centerX {
    CGPoint center = self.center;
    center.x = jw_centerX;
    self.center = center;
}
- (CGFloat)jw_centerX{
    return self.center.x;
}


///centerY
- (void)setJw_centerY:(CGFloat)jw_centerY {
    CGPoint center = self.center;
    center.y = jw_centerY;
    self.center = center;
}
- (CGFloat)jw_centerY {
    return self.center.y;
}



/// right
- (void)setJw_right:(CGFloat)jw_right {
    self.jw_x = jw_right - self.jw_width;
}
- (CGFloat)jw_right {
    return CGRectGetMaxX(self.frame);
}

/// bottom
- (void)setJw_bottom:(CGFloat)jw_bottom {
    self.jw_y = jw_bottom - self.jw_height;
}
- (CGFloat)jw_bottom {
    return CGRectGetMaxY(self.frame);
}

/// origin
- (void)setJw_origin:(CGPoint)jw_origin {
    CGRect frame = self.frame;
    frame.origin = jw_origin;
    self.frame = frame;
}
- (CGPoint)jw_origin{
    return self.frame.origin;
}

/// maxX
- (CGFloat)jw_maxX{
    return self.jw_x + self.jw_width;
}
- (void)setJw_maxX:(CGFloat)jw_maxX {
    self.jw_x = jw_maxX - self.jw_width;
}

- (void)jw_byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
    [self layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
