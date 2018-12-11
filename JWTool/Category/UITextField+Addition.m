//
//  UITextField+Addition.m
//  JWTool
//
//  Created by jiawei on 2018/4/9.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import "UITextField+Addition.h"

static NSString * const PlaceholderColorKey = @"placeholderLabel.textColor";
@implementation UITextField (Addition)
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    NSString *oldPlaceholder = self.placeholder;
    self.placeholder = @" ";
    self.placeholder = oldPlaceholder;
    if (placeholderColor == nil) {
        placeholderColor = [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
    }
    [self setValue:placeholderColor forKeyPath:PlaceholderColorKey];
}

- (UIColor *)placeholderColor {
    return [self valueForKeyPath:PlaceholderColorKey];
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    UIMenuController*menuController = [UIMenuController sharedMenuController];
    if(menuController) {
        [UIMenuController sharedMenuController].menuVisible=NO;
    }
    return NO;
}
@end
