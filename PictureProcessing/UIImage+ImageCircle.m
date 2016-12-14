//
//  UIImage+ImageCircle.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "UIImage+ImageCircle.h"

@interface view : UIView

@property (nonatomic, strong) UIImage *image;

@end
@implementation view

- (void) drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);//保存状态
    CGContextAddEllipseInRect(context, CGRectMake(0, 0, rect.size.width/2, rect.size.height/2));
    CGContextClip(context);
    CGContextFillPath(context);
    [_image drawAtPoint:CGPointMake(0, 0)];
    CGContextRestoreGState(context);
}

@end
@implementation UIImage (ImageCircle)

//将上面的UIView转化为UIImage
- (UIImage *)imageClipCircle{
    CGFloat imageSizeMin = MIN(self.size.width, self.size.height);
    CGSize imageSize = CGSizeMake(imageSizeMin, imageSizeMin);
    
    view *mview = [[view alloc] init];
    mview.image = self;
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    mview.frame = CGRectMake(0, 0, imageSizeMin, imageSizeMin);
    mview.backgroundColor = [UIColor whiteColor];
    [mview.layer renderInContext:context];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageNew;
}


@end
