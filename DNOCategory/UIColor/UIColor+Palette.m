//
//  UIColor+Palette.m
//  BGMSProject-d
//
//  Created by junhong.zhu@lachesis-mh.com on 2016/9/30.
//  Copyright © 2016年 联新. All rights reserved.
//

#import "UIColor+Palette.h"


@implementation UIColor (Palette)

+ (instancetype)randomColor
{
    return [UIColor colorWithRed:arc4random()%256/255.0
                           green:arc4random()%256/255.0
                            blue:arc4random()%256/255.0 alpha:1];
}
+ (instancetype)hexColorWithHexValue:(NSInteger)hexValue
{
    return [UIColor colorWithRed:((hexValue & 0x00FF0000) >> 16) / 255.0
                           green:((hexValue & 0x0000FF00) >> 8) / 255.0
                            blue:((hexValue & 0x000000FF)) / 255.0 alpha:1.0];
}
+ (instancetype)hexColorWithHexString:(NSString *)hexString
{
    if(!hexString){
        return nil;
    }
    NSScanner * scanner = [NSScanner scannerWithString:hexString];
    unsigned long long longlongValue;
    [scanner scanHexLongLong:&longlongValue];
    NSNumber * hexNumber = [NSNumber numberWithLongLong:longlongValue];
    return [self hexColorWithHexValue:hexNumber.integerValue];
}
+ (instancetype)grayscaleColorWithLevel:(CGFloat)level
{
    return [UIColor colorWithWhite:1 - level / 100 alpha:1];
}

+ (UIImage *)imageFromColor:(UIColor *)color
{
    return [self imageFromColor:color size:CGSizeMake(44, 44)];
}


+ (UIImage *)imageFromColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero, size};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
