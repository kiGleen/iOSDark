//
//  UIColor+Manage.h
//  iOSDark
//
//  Created by zoujing on 2020/3/31.
//  Copyright © 2020 gleen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+HEX.h"

@interface UIColor (Manage)

///设置颜色：普通->白色(whiteColor)，暗黑->系统暗黑二级色(secondarySystemBackgroundColor)
+ (UIColor *)dcbWhiteToSecondColor;

///设置颜色：普通->白色(whiteColor)，暗黑->系统暗黑三级色(tertiarySystemBackgroundColor)
+ (UIColor *)dcbWhiteToTertiaryColor;

///设置颜色：普通->灰色(0xF6F8FE)，暗黑->系统暗黑三级色(tertiarySystemBackgroundColor)
+ (UIColor *)dcbGrayToSecondColor;

///设置颜色：普通->灰色(0xF6F8FE)，暗黑->系统暗黑三级色(tertiarySystemBackgroundColor)
+ (UIColor *)dcbGrayToTertiaryColor;

///主文本的字体颜色
+ (UIColor *)dcbMainTextColor;

///次文本字体颜色
+ (UIColor *)dcbGaryTextColor;

/// 分割线，线框颜色
+ (UIColor *)dcbDividerColor;




@end
