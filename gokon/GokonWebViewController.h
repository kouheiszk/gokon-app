//
//  GokonWebViewController.h
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/30.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeModalViewController.h"

@interface GokonWebViewController : UIViewController <QRCodeModalViewControllerDelegate>

@property (copy, nonatomic) NSString *url;

@end
