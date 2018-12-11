//
//  UIBarButtonItem+Addition.m
//  JWTool
//
//  Created by jiawei on 2018/4/12.
//  Copyright © 2018年 com.jw. All rights reserved.
//

#import "UIBarButtonItem+Addition.h"

@implementation UIBarButtonItem (Addition)
+ (instancetype)jw_itemWithImage:(NSString *)image hightImage:(NSString *)hightImage target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)jw_itemWithTarget:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"nav_white_back"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"nav_white_back"] forState:UIControlStateHighlighted];
    CGRect frame = button.frame;
    frame.size = CGSizeMake(30, 30);
    button.frame = frame;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
    
}

+ (instancetype)jw_itemWithWhiteTitle:(NSString *)title Target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    CGRect frame = button.frame;
    frame.size = CGSizeMake(30, 30);
    button.frame = frame;
    [button sizeToFit];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

+ (instancetype)jw_itemWithTitle:(NSString *)title Target:(id)target action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    CGRect frame = button.frame;
    frame.size = CGSizeMake(30, 30);
    button.frame = frame;
    [button sizeToFit];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
    
}
@end
