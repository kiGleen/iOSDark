//
//  UIColor+Manage.m
//  iOSDark
//
//  Created by zoujing on 2020/3/31.
//  Copyright © 2020 gleen. All rights reserved.
//

#import "UIColor+Manage.h"

@implementation UIColor (Manage)

+ (UIColor *)dcbWhiteToSecondColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:[UIColor secondarySystemBackgroundColor]];
    }else {
        return [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:nil];
    }
}

+ (UIColor *)dcbWhiteToTertiaryColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:[UIColor tertiarySystemBackgroundColor]];
    }else {
        return [UIColor colorWithLightColor:[UIColor whiteColor] darkColor:nil];
    }
}


+ (UIColor *)dcbGrayToSecondColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0xF6F8FE] darkColor:UIColor.secondarySystemBackgroundColor];
    }else {
        return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0xF6F8FE] darkColor:nil];
    }
}

+ (UIColor *)dcbGrayToTertiaryColor {
    if (@available(iOS 13.0, *)) {
        return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0xF6F8FE] darkColor:UIColor.tertiarySystemBackgroundColor];
    }else {
        return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0xF6F8FE] darkColor:nil];
    }
}


///主文本的字体颜色
+ (UIColor *)dcbMainTextColor {
    return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0x353D4E] darkColor:[UIColor colorWithRGBHex:0xE1E2E1]];
}

///次文本字体颜色
+ (UIColor *)dcbGaryTextColor {
    return [UIColor colorWithLightColor:[UIColor colorWithRGBHex:0xA7AEBC] darkColor:[UIColor colorWithRGBHex:0xA7AEBC alpha:0.5]];
}

/// 分割线，线框颜色
+ (UIColor *)dcbDividerColor {
    return [UIColor colorWithLightColor:[UIColor redColor] darkColor:[UIColor greenColor]];
}










@end
