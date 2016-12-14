//
//  UIImage+ImageWaterPrint.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "UIImage+ImageWaterPrint.h"

@implementation UIImage (ImageWaterPrint)

- (UIImage *)imageWater:(UIImage *)imageLogo waterString:(NSString *)waterString{
    UIGraphicsBeginImageContext(self.size);
    //原始图片渲染
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CGFloat waterX = 600;
    CGFloat waterY = 440;
    CGFloat waterW = 30;
    CGFloat waterH = 30;

    //logo渲染
    [imageLogo drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    //文字渲染
    NSMutableParagraphStyle *paragraphyStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphyStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20.0], NSParagraphStyleAttributeName:paragraphyStyle, NSForegroundColorAttributeName:[UIColor redColor]};
    [waterString drawInRect:CGRectMake(0, 0, 300, 60) withAttributes:dic];
    
    //UIImage
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageNew;
}

@end
