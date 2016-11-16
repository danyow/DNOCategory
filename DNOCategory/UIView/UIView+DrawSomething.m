//
//  UIView+DrawSomething.m
//  BGMSProject-d
//
//  Created by junhong.zhu@lachesis-mh.com on 2016/10/11.
//  Copyright © 2016年 联新. All rights reserved.
//

#import "UIView+DrawSomething.h"

@implementation UIView (DrawSomething)


- (UIBezierPath *)roundPathWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngel endAngel:(CGFloat)endAngle
{
    return [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngel endAngle:endAngle clockwise:YES];
}
- (UIBezierPath *)roundPathWithCenter:(CGPoint)center radius:(CGFloat)radius
{
    return [self roundPathWithCenter:center radius:radius startAngle:0 endAngel:M_PI * 2];
}

- (UIBezierPath *)arcPathWithRadius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle
{
    return [self roundPathWithCenter:CGPointMake(radius, radius) radius:radius startAngle:startAngle endAngel:endAngle];
}
- (CAShapeLayer *)arcLayerWithPath:(UIBezierPath *)path color:(UIColor *)color frame:(CGRect)frame
{
    CAShapeLayer *layer = [self layerWithPath:path color:color fill:NO];
    layer.lineWidth = 2;
    layer.frame = frame;
    return layer;
}
- (CAShapeLayer *)layerWithPath:(UIBezierPath *)path color:(UIColor *)color fill:(BOOL)fill
{
    CAShapeLayer *layer = CAShapeLayer.new;
    layer.path = path.CGPath;
    if (fill) {
        layer.strokeColor   = [UIColor clearColor].CGColor;
        layer.fillColor     = color.CGColor;
    } else {
        layer.fillColor     = [UIColor clearColor].CGColor;
        layer.strokeColor   = color.CGColor;
        layer.lineJoin      = @"round";
    }
    return layer;
}
- (void)arcLoadingAnimationWithLayer:(CAShapeLayer *)layer duration:(CGFloat)duration
{
    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.values = @[@0, @(M_PI), @(2 * M_PI)];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.values = @[@1, @0.5, @1];
    
    CAAnimationGroup *groupAnimation = CAAnimationGroup.new;
    groupAnimation.animations = @[rotationAnimation, scaleAnimation];
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.repeatCount = MAXFLOAT;
    groupAnimation.duration = duration;
    [self.layer addAnimation:groupAnimation forKey:@"group"];
}

- (void)setupMulticolorWithLayer:(CAGradientLayer *)layer cgColors:(NSArray *)cgColors
{
    layer.startPoint = CGPointMake(0.0, 0.0);
    layer.endPoint   = CGPointMake(0.0, 1.0);
    
    NSMutableArray *colors = [NSMutableArray array];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60 / 255.0 green:120 / 255.0 blue:191 / 255.0 alpha:1.0].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [colors addObject:(id)[UIColor whiteColor].CGColor];
    [layer setColors:cgColors];
}

- (CABasicAnimation *)animationWithKeyPath:(NSString *)keyPath
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = kFloat_AnimationDuration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    return animation;
}


@end
