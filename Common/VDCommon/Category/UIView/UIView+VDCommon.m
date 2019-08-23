//
//  UIView+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "UIView+VDCommon.h"
#import <objc/runtime.h>

@interface UIView()

@property (nonatomic, strong)CAGradientLayer *vd_backgroundColorsLayer;

@property (nonatomic, strong)UILabel *vd_colorsLabel;
@property (nonatomic, strong)CAGradientLayer *vd_colorLabelLayer;

@end
@implementation UIView (VDCommon)
// [GET方法]

- (CGFloat)v_x{
    return self.frame.origin.x;
}

- (CGFloat)v_y{
    return self.frame.origin.y;
}

- (CGFloat)v_w{
    return self.frame.size.width;
}

- (CGFloat)v_h{
    return self.frame.size.height;
}

- (CGFloat)v_centerX{
    return self.center.x;
}

- (CGFloat)v_centerY{
    return self.center.y;
}
- (CGFloat)v_top{
    return self.v_y;
}
- (CGFloat)v_left{
    return self.v_x;
}
- (CGFloat)v_bottom{
    return (self.v_y + self.v_h);
}
- (CGFloat)v_right{
    return (self.v_x + self.v_w);
}
- (CGSize)v_size{
    return self.frame.size;
}
- (CGPoint)v_origin{
    return self.frame.origin;
}
// [SET方法]

- (void)setV_x:(CGFloat)v_x{
    self.frame = CGRectMake(v_x, self.v_y, self.v_w, self.v_h);
}

- (void)setV_y:(CGFloat)v_y{
    self.frame = CGRectMake(self.v_x, v_y, self.v_w, self.v_h);
}

- (void)setV_w:(CGFloat)v_w{
    self.frame = CGRectMake(self.v_x, self.v_y, v_w, self.v_h);
}

- (void)setV_h:(CGFloat)v_h{
    self.frame = CGRectMake(self.v_x, self.v_y, self.v_w, v_h);
}

- (void)setV_centerX:(CGFloat)v_centerX{
    self.center = CGPointMake(v_centerX, self.v_centerY);
}

- (void)setV_centerY:(CGFloat)v_centerY{
    self.center = CGPointMake(self.v_centerX, v_centerY);
}
- (void)setV_size:(CGSize)v_size{
    self.frame = CGRectMake(self.v_x, self.v_y, v_size.width, v_size.height);
}
- (void)setV_origin:(CGPoint)v_origin{
    self.frame = CGRectMake(v_origin.x, v_origin.y, self.v_w, self.v_h);
}

#pragma mark [layer]

- (CGFloat)v_cornerRadius{
    return self.layer.cornerRadius;
}

- (void)setV_cornerRadius:(CGFloat)v_cornerRadius{
    self.layer.cornerRadius = v_cornerRadius;
    self.layer.masksToBounds = YES;
}

static char *VDBackgroundColorsLayerKey = "VDBackgroundColorsLayerKey";

- (CAGradientLayer *)vd_backgroundColorsLayer {
    return objc_getAssociatedObject(self, VDBackgroundColorsLayerKey);
}

- (void)setVd_backgroundColorsLayer:(CAGradientLayer *)vd_backgroundColorsLayer {
    objc_setAssociatedObject(self, VDBackgroundColorsLayerKey, vd_backgroundColorsLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray<UIColor *> *)v_backgroundColors {
    return nil;
}
- (void)setV_backgroundColors:(NSArray<UIColor *> *)v_backgroundColors {
    if (v_backgroundColors == nil) {
        [self v_clearColors];
    }else {
        [self v_clearColors];
        self.vd_backgroundColorsLayer = [self v_getColorsLayer:v_backgroundColors frame:self.bounds isHorizontal:YES];
        [self.layer insertSublayer:self.vd_backgroundColorsLayer atIndex:0];
        [self vd_addFrameObserver];
    }
    
}

#pragma mark - textColors
static char *VDColorsLabelKey = "VDColorsLabelKey";

- (UILabel *)vd_colorsLabel {
    return objc_getAssociatedObject(self, VDColorsLabelKey);
}

- (void)setVd_colorsLabel:(UILabel *)vd_colorsLabel {
    objc_setAssociatedObject(self, VDColorsLabelKey, vd_colorsLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static char *VDColorLabelLayerKey = "VDColorLabelLayerKey";

- (CAGradientLayer *)vd_colorLabelLayer {
    return objc_getAssociatedObject(self, VDColorLabelLayerKey);
}

- (void)setVd_colorLabelLayer:(CAGradientLayer *)vd_colorLabelLayer {
    objc_setAssociatedObject(self, VDColorLabelLayerKey, vd_colorLabelLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSArray<UIColor *> *)v_textColors {
    return nil;
}

- (void)setV_textColors:(NSArray<UIColor *> *)v_textColors {
    
    if (![self isKindOfClass:[UILabel class]]) {
        
        NSLog(@"VDCommon setV_textColors error: this is not label");
    } else {
        
        if (v_textColors == nil && self.vd_colorLabelLayer) {
            [self.vd_colorsLabel removeFromSuperview];
            [self.vd_colorLabelLayer removeFromSuperlayer];
            [self vd_removeColorsTextObserver];
            return;
        }
        
        ((UILabel *)self).textColor = UIColor.clearColor;
        self.vd_colorsLabel = [[UILabel alloc]initWithFrame:self.bounds];
        self.vd_colorsLabel.font = ((UILabel *)self).font;
        self.vd_colorsLabel.text = ((UILabel *)self).text;
        self.vd_colorsLabel.textAlignment = ((UILabel *)self).textAlignment;
        [self addSubview:self.vd_colorsLabel];
        self.vd_colorLabelLayer = [self v_getColorsLayer:v_textColors frame:self.bounds isHorizontal:NO];
        [self.layer addSublayer:self.vd_colorLabelLayer];
        self.vd_colorLabelLayer.mask = self.vd_colorsLabel.layer;
        [self vd_addColorsTextObserver];
    }
    
}

#pragma mark [method]

- (CAGradientLayer *)v_getColorsLayer:(NSArray *)colors frame:(CGRect)frame isHorizontal:(BOOL)isHorizontal {
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    [layer setFrame:frame];
    NSMutableArray *arr = [NSMutableArray array];
    for (UIColor *color in colors) {
        [arr addObject:(__bridge id)color.CGColor];
    }
    [layer setColors:arr];
    [layer setStartPoint:CGPointMake(0.0, 0.0)];
    if (isHorizontal) {
        [layer setEndPoint:CGPointMake(1.0, 0.0)];
    }else {
        [layer setEndPoint:CGPointMake(0.0, 1.0)];
    }
    return layer;
}

- (void)v_clearColors {
    if (self.vd_backgroundColorsLayer) {
        [self vd_removeFrameObserver];
        [self.vd_backgroundColorsLayer removeFromSuperlayer];
        self.vd_backgroundColorsLayer = nil;
    }
}

#pragma mark - KVO
- (void)v_observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([keyPath isEqualToString:@"frame"]) {
        
        if (self.vd_colorsLabel) {
            
            UILabel *this = (UILabel *)self;
            self.vd_colorsLabel.frame = this.bounds;
            self.vd_colorLabelLayer.frame = this.bounds;
        }
        if (self.vd_backgroundColorsLayer) {
            
            self.vd_backgroundColorsLayer.frame = self.bounds;
        }
    } else if ([keyPath isEqualToString:@"font"]) {
        
        UILabel *this = (UILabel *)self;
        self.vd_colorsLabel.font = this.font;
        
    } else if ([keyPath isEqualToString:@"text"]) {
        
        UILabel *this = (UILabel *)self;
        self.vd_colorsLabel.text = this.text;
    } else if ([keyPath isEqualToString:@"textAlignment"]) {
        
        UILabel *this = (UILabel *)self;
        self.vd_colorsLabel.textAlignment = this.textAlignment;
    }  else if ([keyPath isEqualToString:@"textColor"]) {
        
        [self removeObserver:self forKeyPath:@"textColor"];
        UILabel *this = (UILabel *)self;
        this.textColor = UIColor.clearColor;
        [self addObserver:self forKeyPath:@"textColor" options:NSKeyValueObservingOptionNew context:nil];
    }
}

// frame

- (void)vd_addFrameObserver {
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)vd_addColorsTextObserver {
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"textAlignment" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"textColor" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)vd_removeColorsTextObserver {
    
    if (self.vd_colorLabelLayer) {
        
        [self removeObserver:self forKeyPath:@"frame"];
        [self removeObserver:self forKeyPath:@"font"];
        [self removeObserver:self forKeyPath:@"text"];
        [self removeObserver:self forKeyPath:@"textAlignment"];
        [self removeObserver:self forKeyPath:@"textColor"];
    }
}

- (void)vd_removeFrameObserver {
    
    if (self.vd_backgroundColorsLayer) {
        
        [self removeObserver:self forKeyPath:@"frame"];
    }
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        Method setTextMethod = class_getInstanceMethod(class, NSSelectorFromString(@"dealloc"));
        Method replaceSetTextMethod = class_getInstanceMethod(class, NSSelectorFromString(@"v_dealloc"));
        method_exchangeImplementations(setTextMethod, replaceSetTextMethod);
        
        Method observeMethod = class_getInstanceMethod(class, @selector(observeValueForKeyPath:ofObject:change:context:));
        Method replaceObserveMethod = class_getInstanceMethod(class, @selector(v_observeValueForKeyPath:ofObject:change:context:));
        method_exchangeImplementations(observeMethod, replaceObserveMethod);
        
    });
}

- (void)v_dealloc {
    
    [self vd_removeColorsTextObserver];
    [self vd_removeFrameObserver];
}


@end
