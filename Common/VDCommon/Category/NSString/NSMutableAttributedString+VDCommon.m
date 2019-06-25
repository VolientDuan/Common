//
//  NSMutableAttributedString+VDCommon.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "NSMutableAttributedString+VDCommon.h"
#import "NSString+VDCommon.h"

@implementation NSMutableAttributedString (VDCommon)

- (NSMutableAttributedString *)vd_setColor:(UIColor *)color range:(NSRange)range{
    [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    return self;
}
- (NSMutableAttributedString *)vd_setFont:(UIFont *)font range:(NSRange)range{
    [self addAttribute:NSFontAttributeName value:font range:range];
    return self;
}
- (NSMutableAttributedString *)vd_setUnderline:(NSRange)range{
    [self addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];
    return self;
}

- (NSMutableAttributedString *)vd_setFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range {
    if (font) {
        [self vd_setFont:font range:range];
    }
    if (color) {
        [self vd_setColor:color range:range];
    }
    return self;
}

- (NSMutableAttributedString *)vd_setFont:(UIFont *)font color:(UIColor *)color text:(NSString *)text index:(NSInteger)index {
    
    if (index < 0) {
        NSArray *rangs = [self.string vd_rangsWithSubString:text];
        for (NSString *rangStr in rangs) {
            [self vd_setFont:font color:color range:NSRangeFromString(rangStr)];
        }
    } else if (index == 0) {
        NSRange range = [self.string rangeOfString:text];
        if (range.location != NSNotFound) {
            [self vd_setFont:font color:color range:range];
        }
    } else {
        NSArray *rangs = [self.string vd_rangsWithSubString:text];
        if (rangs.count > index) {
            [self vd_setFont:font color:color range:NSRangeFromString(rangs[index])];
        }
    }
    return self;
}

@end
