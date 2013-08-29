//
//  EnquateInvitationViewController.m
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import "EnquateInvitationViewController.h"

@interface EnquateInvitationViewController ()

@end

@implementation EnquateInvitationViewController

@synthesize qrCodeValue;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createQRCodeTapped:(id)sender {
    QRCodeModalViewController *qrCodeModalViewController = [[QRCodeModalViewController alloc] init];
    qrCodeModalViewController.delegate = self;
    qrCodeModalViewController.qrCodeValue = self.qrCodeValue;
    [self presentViewController:qrCodeModalViewController animated:YES completion:nil];
}

#pragma mark - QRCodeModalViewController delegate

-(void)didPressCloseButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
