//
//  UIColor+HEX.h
//  iOSDark
//
//  Created by zoujing@gogpay.cn on 2020/3/31.
//  Copyright © 2020 cn.gogpay.dcb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color;


/// 十六进制字符串获取颜色
/// @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


/// 将16进制的颜色值转化为颜色 默认alpha值为1.0
+ (UIColor *)colorWithRGBHex:(NSInteger)rgbHex;


/// 将16进制的颜色值转化为颜色
/// @param rgbHex 16进制的颜色值 NSInteger类型
/// @param alpha 透明度
+ (UIColor *)colorWithRGBHex:(NSInteger)rgbHex alpha:(CGFloat)alpha;


/// 适配暗黑模式颜色
/// @param lightColor 普通模式下的颜色
/// @param darkColor 暗黑模式下的颜色
+ (UIColor*)colorWithLightColor:(UIColor*)lightColor darkColor:(UIColor *)darkColor;

@end

