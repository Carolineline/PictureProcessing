//
//  UIImage+ImageWaterPrint.h
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageWaterPrint)
- (UIImage *)imageWater:(UIImage *)imageLogo waterString:(NSString *)waterString;
@end