//
//  UIImage+ImageRotate.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "UIImage+ImageRotate.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>


/**
 图片的旋转
 1 将图片渲染到上下文中
 2 旋转上下文
 3 将旋转之后的上下文保存为图片
 */
@implementation UIImage (ImageRotate)

- (UIImage *)imageRotateIndegree:(float)degree{
    //1 image -> Context
    size_t width = (size_t)(self.size.width * self.scale);
    size_t height = (size_t)(self.size.height * self.scale);
    
    size_t bytesPerRow = width * 4;//每行像素的比特数
    CGImageAlphaInfo alphaInfo = kCGImageAlphaPremultipliedFirst;//alpha
    //配置上下文参数
    CGContextRef bmContext = CGBitmapContextCreate(NULL, width, height, 8, bytesPerRow, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrderDefault | alphaInfo);    //2的8次方255种颜色，颜色的深度

    if (!bmContext) {
        return nil;
    }
    CGContextDrawImage(bmContext, CGRectMake(0, 0, width, height), self.CGImage);
    //2 旋转
    
    //参数1 旋转源
    //参数2 旋转之后的图片
    //参数3 忽略
    //参数4 旋转的角度
    //参数5 背景颜色
    //参数6 填充颜色
    
    UInt8 *data = (UInt8 *)CGBitmapContextGetData(bmContext);
    vImage_Buffer src = {data, height, width,bytesPerRow};
    vImage_Buffer dest = {data, height, width,bytesPerRow};
    Pixel_8888 bgColor = {0,0,0,0};
    vImageRotate_ARGB8888(&src, &dest, NULL, degree, bgColor, kvImageBackgroundColorFill);
    //3 Content -> UIImage
    CGImageRef rotateImageRef = CGBitmapContextCreateImage(bmContext);
    UIImage *rotateImage = [UIImage imageWithCGImage:rotateImageRef scale:self.scale orientation:self.imageOrientation];
    return rotateImage;
}



@end
