//
//  UIImage+ImageScale.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "UIImage+ImageScale.h"

@implementation UIImage (ImageScale)
- (UIImage *) imageScale:(CGSize)size{
    
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageNew;

}
@end
