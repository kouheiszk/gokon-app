//
//  EnquateSelectNumberViewController.m
//  gokon
//
//  Created by Suzuki Kouhei on 2013/08/28.
//  Copyright (c) 2013年 鈴木 康平. All rights reserved.
//

#import "EnquateSelectNumberViewController.h"
#import "EnquateInvitationViewController.h"

@interface EnquateSelectNumberViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIStepper *numberStepper;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@end

@implementation EnquateSelectNumberViewController

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
    
    // Stepper Settings
    _numberStepper.value = 8;
    _numberStepper.minimumValue = 1;
    _numberStepper.maximumValue = 20;
    _numberStepper.stepValue = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - xib callback

- (IBAction)changeStepper:(id)sender {
    _numberLabel.text = [NSString stringWithFormat:@"%d", (int)_numberStepper.value];
}

- (IBAction)createButtonTapped:(id)sender {
    
    NSString *createURL = @"http://gokon-apps.herokuapp.com/create";
    NSURL *url = [NSURL URLWithString:createURL];
    
    NSString *jsonString = [NSString stringWithFormat:@"{\"number\":%d}", (int)_numberStepper.value];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:data];
    [request setHTTPMethod:@"POST"];
    
    NSURLResponse *response;
    NSError *error = nil;
    NSData *result = [NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response
                                                       error:&error];

    if(error) {
        NSLog(@"error = %@", error);
        return;
    }
    
    NSString *receivedString = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    NSData *receivedData = [receivedString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *receivedDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
    
    NSString *enquateUrl = [NSString stringWithFormat:@"http://gokon-apps.herokuapp.com/answerQuestions?survey_id=%@", receivedDictionary[@"survey_id"]];
    
    EnquateInvitationViewController *enquateInvitationViewController = [[EnquateInvitationViewController alloc] init];
    enquateInvitationViewController.qrCodeValue = enquateUrl;
    
    [self.navigationController pushViewController:enquateInvitationViewController animated:YES];
}

@end
