//
//  UIView+ImageScreenShot.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "UIView+ImageScreenShot.h"

@implementation UIView (ImageScreenShot)
- (UIImage *)imageScreenShot{
    //将当前的layer图层渲染到当前屏幕上，并将当前的屏幕保存到UIImage
    UIGraphicsBeginImageContext(self.frame.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imageNew = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
     
    return imageNew;
}
@end
