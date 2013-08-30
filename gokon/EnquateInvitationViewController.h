//
//  EnquateInvitationViewController.h
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRCodeModalViewController.h"

@interface EnquateInvitationViewController : UIViewController <QRCodeModalViewControllerDelegate>

@property (copy, nonatomic) NSString *answerEnquateURL;

@end
