//
//  UIImage+VDCommon.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (VDCommon)

#pragma mark - 位置和大小

- (UIImage *)vd_fixOrientation;

- (UIImage *)vd_thumbnailWithSize:(CGSize)asize;

- (UIImage *)vd_rescaleImageToSize:(CGSize)size;

- (UIImage *)vd_cropImageToRect:(CGRect)cropRect;

- (CGSize)vd_calculateNewSizeForCroppingBox:(CGSize)croppingBox;

- (UIImage *)vd_cropCenterAndScaleImageToSize:(CGSize)cropSize;

- (UIImage *)vd_cropToSquareImage;

#pragma mark - 颜色

+ (UIImage *)vd_imageWithColor:(UIColor *)color;

+ (UIImage *)vd_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - base64

- (NSString *)vd_base64Encoding;

+ (UIImage *)vd_imageWithbase64Str:(NSString *)base64Str;

#pragma mark - tintColor

// tint只对里面的图案作更改颜色操作
- (UIImage *)vd_imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)vd_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)vd_imageWithGradientTintColor:(UIColor *)tintColor;

#pragma mark - imageEffect
- (UIImage *)vd_applyLightEffect;
- (UIImage *)vd_applyExtraLightEffect;
- (UIImage *)vd_applyDarkEffect;
- (UIImage *)vd_applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)vd_blurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor deltaFactor:(CGFloat)deltaFactor maskImage:(UIImage *)maskImage;

@end
