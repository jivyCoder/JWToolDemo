//
//  UIButton+Addition.m
//  JWTool
//
//  Created by jiawei on 2018/4/7.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import "UIButton+Addition.h"
#import <objc/runtime.h>
#import <objc/message.h>

//static const void *kSelector = "kSelector";
//static const void *kTarget = "kTarget";

@implementation UIButton (Addition)

+ (instancetype)jw_buttonWithImage:(NSString *)image
                      highImage:(NSString *)highImage
                          title:(NSString *)title
                         target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button sizeToFit];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    return button;
}
+ (instancetype)jw_buttonWithTitle:(NSString *)title
                         Target:(id )target
                         action:(SEL)action {
    UIButton  *refreshBtn = [UIButton jw_buttonWithImage:@"" highImage:@"" title:title target:target action:action];
    return refreshBtn;
}


- (void)jw_layoutButtonWithEdgeInsetsStyle:(JWButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space {
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (style) {
        case JWButtonEdgeInsetsStyleTop: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case JWButtonEdgeInsetsStyleLeft: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case JWButtonEdgeInsetsStyleBottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case JWButtonEdgeInsetsStyleRight: {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
