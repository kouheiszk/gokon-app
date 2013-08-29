//
//  QRCodeModalViewController.h
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QRCodeModalViewControllerDelegate <NSObject>

-(void)didPressCloseButton;

@end

@interface QRCodeModalViewController : UIViewController

@property (copy, nonatomic) NSString *qrCodeValue;

@property (nonatomic, weak) id<QRCodeModalViewControllerDelegate> delegate;

@end
