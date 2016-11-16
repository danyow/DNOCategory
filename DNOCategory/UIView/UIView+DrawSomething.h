//
//  UIView+DrawSomething.h
//  BGMSProject-d
//
//  Created by junhong.zhu@lachesis-mh.com on 2016/10/11.
//  Copyright © 2016年 联新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DrawSomething)

- (UIBezierPath *)roundPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngel endAngel:(CGFloat)endAngle;
- (UIBezierPath *)roundPathWithCenter:(CGPoint)center radius:(CGFloat)radius;
- (UIBezierPath *)arcPathWithRadius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
- (CAShapeLayer *)arcLayerWithPath:(UIBezierPath *)path color:(UIColor *)color frame:(CGRect)frame;
- (CAShapeLayer *)layerWithPath:(UIBezierPath *)path color:(UIColor *)color fill:(BOOL)fill;
- (void)arcLoadingAnimationWithLayer:(CAShapeLayer *)layer duration:(CGFloat)duration;
- (void)setupMulticolorWithLayer:(CAGradientLayer *)layer cgColors:(NSArray *)cgColors;
- (CABasicAnimation *)animationWithKeyPath:(NSString *)keyPath;

@end
