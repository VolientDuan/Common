//
//  VDQRCodeTool.m
//  Common
//
//  Created by volientDuan on 2018/12/12.
//  Copyright © 2018 volientDuan. All rights reserved.
//

#import "VDQRCodeTool.h"

@implementation VDQRCodeTool

+ (UIImage *)qrImageForString:(NSString *)string imageWidth:(CGFloat)ImageWidth{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    [filter setValue:[string dataUsingEncoding:NSUTF8StringEncoding] forKey:@"inputMessage"];//通过kvo方式给一个字符串，生成二维码
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];//设置二维码的纠错水平，越高纠错水平越高，可以污损的范围越大
    CIImage *outPutImage = [filter outputImage];//拿到二维码图片
    return [self createUIImageFormCIImage:outPutImage withSize:ImageWidth];
}
+ (UIImage *)createUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)ImageWidth{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(ImageWidth/CGRectGetWidth(extent), ImageWidth/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
}
+ (UIImage *)getImageFromView:(UIView *)theView
{
    //UIGraphicsBeginImageContext(theView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(theView.bounds.size, YES, theView.layer.contentsScale);
    [theView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIView *)getViewWithImage:(UIImage *)image size:(CGSize)size{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    view.backgroundColor = [UIColor whiteColor];
    CGFloat x = size.width * 0.1;
    CGFloat y = size.height * 0.1;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, size.width-2*x, size.height-2*y)];
    [imageView setImage:image];
    [view addSubview:imageView];
    return view;
}
+ (UIImage *)qrCodeImage:(UIImage *)codeImage logo:(UIImage *)logo{
    //给二维码加 logo 图
    CGSize size = codeImage.size;
    CGSize logoSize = CGSizeMake(size.width*0.382, size.height*0.382);
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    [codeImage drawInRect:CGRectMake(0,0 , size.width, size.height)];
    //logo图加白边
    logo = [self getImageFromView:[self getViewWithImage:logo size:logoSize]];
    //把logo图画到生成的二维码图片上，注意尺寸不要太大（最大不超过二维码图片的%30），太大会造成扫不出来
    [logo drawInRect:CGRectMake((size.width-logoSize.width)/2.0, (size.height-logoSize.height)/2.0, logoSize.width, logoSize.height)];
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newPic;
}

@end
