//
//  QRCodeModalViewController.m
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import "QRCodeModalViewController.h"
#import <ZXingObjC/ZXingObjC.h>

@interface QRCodeModalViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@end

@implementation QRCodeModalViewController

@synthesize qrCodeValue;

#pragma mark - initialize

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - lifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //[self createQrCode:resultString];
    [self createQrCode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - QRCodeModalViewController Delegate

-(IBAction)pressClosedButton:(id)sender
{
    if([_delegate respondsToSelector:@selector(didPressCloseButton)]){
        [_delegate didPressCloseButton];
    }
}

#pragma mark - createQrCode

- (void)createQrCode
{
    NSString *qrCodeText = self.qrCodeValue;

    if (qrCodeText == nil || [qrCodeText isEqualToString:@""]) {
        self.qrCodeImageView.image = nil;
        return;
    }

    // QRコードを生成します。
    ZXMultiFormatWriter* writer = [[ZXMultiFormatWriter alloc] init];
    CGSize imageSize = self.qrCodeImageView.frame.size;
    ZXBitMatrix* result = [writer encode:qrCodeText
                                  format:kBarcodeFormatQRCode
                                   width:imageSize.width
                                  height:imageSize.height
                                   error:nil];

    if (result == nil) {
        self.qrCodeImageView.image = nil;
        return;
    }

    // QRコードを表示します。
    CGImageRef qrImageRef = [ZXImage imageWithMatrix:result].cgimage;
    self.qrCodeImageView.image = [UIImage imageWithCGImage:qrImageRef];
}

@end
