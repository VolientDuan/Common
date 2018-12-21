//
//  VDAnimation.m
//  Common
//
//  Created by volientDuan on 2018/12/19.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDAnimation.h"
#import <CoreText/CoreText.h>
@implementation VDAnimation
+ (CABasicAnimation *)setAnimationWithText:(NSString *)text fontName:(NSString *)fontName fontSize:(CGFloat)fontSize fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor lineWidth:(CGFloat)lineWidth duration:(CFTimeInterval)duration toView:(UIView *)view {
    // 做字迹动画时 首先需要获取字迹路径
    UIBezierPath *path = [self getPathWithText:text fontName:fontName fontSize:fontSize];
    // 创建字迹路径图层 并添加至view
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.frame = view.layer.bounds;
    pathLayer.bounds = CGPathGetBoundingBox(path.CGPath);
    pathLayer.backgroundColor = [view.backgroundColor CGColor];
    pathLayer.geometryFlipped = YES;
    pathLayer.path = path.CGPath;
    pathLayer.strokeColor = strokeColor.CGColor;
    pathLayer.fillColor = fillColor.CGColor;
    pathLayer.lineWidth = lineWidth;
    pathLayer.lineJoin = kCALineJoinMiter;
    [view.layer addSublayer:pathLayer];
    // 给绘制图层添加动画
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses = YES;
    pathAnimation.repeatCount = MAXFLOAT;
    //当动画结束移除效果-----同时可以解决页面跳转返回后动画停止问题
    pathAnimation.removedOnCompletion = NO;
    [pathLayer addAnimation:pathAnimation forKey:@"strokeStart"];
    return pathAnimation;
}

+ (UIBezierPath *)getPathWithText:(NSString *)text fontName:(NSString *)fontName fontSize:(CGFloat)fontSize {
    //创建可变path
    CGMutablePathRef letters = CGPathCreateMutable();
    //设置字体
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)fontName, fontSize, NULL);
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                           (__bridge id)font, kCTFontAttributeName,
                           nil];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:text
                                                                     attributes:attrs];
    //根据字符串创建 line
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)attrString);
    //获取每一个字符作为数组
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    
    // 遍历字符数组
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        // Get FONT for this run
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        // for each GLYPH in run
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            // get Glyph & Glyph-data
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            // Get PATH of outline
            {
                CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
                CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
                CGPathAddPath(letters, &t, letter);
                CGPathRelease(letter);
            }
        }
    }
    CFRelease(line);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path appendPath:[UIBezierPath bezierPathWithCGPath:letters]];
    CGPathRelease(letters);
    CFRelease(font);
    return path;
}

@end
