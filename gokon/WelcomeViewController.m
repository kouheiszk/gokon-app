//
//  WelcomeViewController.m
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import "WelcomeViewController.h"

// Enquate
#import "GokonWebViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

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

#pragma mark - xib callback

- (IBAction)startEnqueteTapped:(id)sender {
    // [self.navigationController pushViewController:[[EnquateSelectNumberViewController alloc] init] animated:YES];

    NSString *url = @"http://gokon-apps.herokuapp.com";
    GokonWebViewController *gokonWevViewController = [[GokonWebViewController alloc] init];
    gokonWevViewController.url = url;
    [self.navigationController pushViewController:gokonWevViewController animated:YES];
}

@end
