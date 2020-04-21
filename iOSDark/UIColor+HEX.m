//
//  UIColor+HEX.m
//  iOSDark
//
//  Created by zoujing@gogpay.cn on 2020/3/31.
//  Copyright © 2020 cn.gogpay.dcb. All rights reserved.
//

#import "UIColor+HEX.h"

@implementation UIColor (HEX)

+ (UIColor *)colorWithHexString:(NSString *)color {
    return [self colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r  截取的range = (0,2)
    NSString *rString = [cString substringWithRange:range];
    //g  截取的range = (2,2)
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b  截取的range = (4,2)
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values 将字符串十六进制两位数字转为十进制整数
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}


#pragma mark - ---将16进制的颜色值转化为颜色
/// 将16进制的颜色值转化为颜色 默认alpha值为1.0
+ (UIColor *)colorWithRGBHex:(NSInteger)rgbHex {
    return [self colorWithRGBHex:rgbHex alpha:1.0];
}

/// 将16进制的颜色值转化为颜色
/// @param rgbHex 16进制的颜色值 NSInteger类型
/// @param alpha 透明度
+ (UIColor *)colorWithRGBHex:(NSInteger)rgbHex alpha:(CGFloat)alpha {
    CGFloat red = ((CGFloat)((rgbHex & 0xFF0000) >> 16)) / 255.0;
    CGFloat green = ((CGFloat)((rgbHex & 0xFF00) >> 8)) / 255.0;
    CGFloat blue = ((CGFloat)(rgbHex & 0xFF)) / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

/// 适配暗黑模式颜色
/// @param lightColor 普通模式下的颜色
/// @param darkColor 暗黑模式下的颜色
+ (UIColor*)colorWithLightColor:(UIColor*)lightColor darkColor:(UIColor *)darkColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithDynamicProvider:^UIColor *_Nonnull(UITraitCollection *_Nonnull traitCollection) {
            if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
                return darkColor;
            }else {
                return lightColor;
            }
        }];
    } else {
        return lightColor ? lightColor : (darkColor ? darkColor : [UIColor clearColor]);
    }
}


@end
