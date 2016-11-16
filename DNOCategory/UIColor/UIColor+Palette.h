//
//  UIColor+Palette.h
//  BGMSProject-d
//
//  Created by junhong.zhu@lachesis-mh.com on 2016/9/30.
//  Copyright © 2016年 联新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Palette)

+ (instancetype)randomColor;
+ (instancetype)hexColorWithHexValue:(NSInteger)hexValue;
+ (instancetype)hexColorWithHexString:(NSString *)hexString;
+ (instancetype)grayscaleColorWithLevel:(CGFloat)level;
+ (UIImage *)imageFromColor:(UIColor *)color;
+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size;
@end
