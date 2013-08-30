//
//  GokonWebViewController.m
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/30.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import "GokonWebViewController.h"

@interface GokonWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation GokonWebViewController

@synthesize url;

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

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createQRCodePressed:(id)sender {
    QRCodeModalViewController *qrCodeModalViewController = [[QRCodeModalViewController alloc] init];
    qrCodeModalViewController.delegate = self;
    qrCodeModalViewController.qrCodeValue = url;
    [self presentViewController:qrCodeModalViewController animated:YES completion:nil];
}

#pragma mark - QRCodeModalViewController delegate

-(void)didPressCloseButton
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
