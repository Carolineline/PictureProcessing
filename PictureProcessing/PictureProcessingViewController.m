//
//  PictureProcessingViewController.m
//  PictureProcessing
//
//  Created by 晓琳 on 16/12/13.
//  Copyright © 2016年 xiaolin.han. All rights reserved.
//

#import "PictureProcessingViewController.h"
#import "UIImage+ImageRotate.h"
#import "UIImage+ImageCut.h"
#import "UIImage+ImageCircle.h"
#import "UIImage+ImageScale.h"
#import "UIView+ImageScreenShot.h"
#import "UIImage+ImageWaterPrint.h"
@interface PictureProcessingViewController ()

@end

@implementation PictureProcessingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self testImageRotate];
//    [self testImageScale];
//    [self testImageScreenShot];
    [self testImageWater];
}
- (void) testImageWater{
    UIImage *myImage = [UIImage imageNamed:@"1.jpg"];
    UIImage *imageLogo = [UIImage imageNamed:@"head@2x.png"];
    UIImage *imageNew = [myImage imageWater:imageLogo waterString:@"xiaolin.logo"];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    

}
- (void) testImageScreenShot{
    self.view.backgroundColor = [UIColor redColor];

    UIImage *imageNew = [self.view imageScreenShot];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
}
- (void) testImageRotate{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImage *imageNew = [image imageRotateIndegree:45*0.1745];// 3.14/180 逆时针旋转45度
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    
}
- (void) testImageCut{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImage *imageNew = [image imageCutSize:CGRectMake(100, 100, 300, 200)];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    

}
- (void) testImageCircle{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImage *imageNew = [image imageClipCircle];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    
}

- (void) testImageScale{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImage *imageNew = [image imageScale:CGSizeMake(500, 500)];
    UIImageWriteToSavedPhotosAlbum(imageNew, nil, nil, nil);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
