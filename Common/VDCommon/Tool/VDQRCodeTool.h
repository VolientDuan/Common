//
//  VDQRCodeTool.h
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VDQRCodeTool : NSObject

+ (UIImage *)qrImageForString:(NSString *)string imageWidth:(CGFloat)ImageWidth;
+ (UIImage *)qrCodeImage:(UIImage *)codeImage logo:(UIImage *)logo;

@end
