//
//  ViewController.m
//  ExchangeRates
//
//  Created by Artem Boltushkin on 29.08.16.
//  Copyright © 2016 ArtemBoltushkin. All rights reserved.
//

#import "ViewController.h"
#import "CLabel.h"
#import "ViewControllerModel.h"
#import "NSString+Extensions.h"

@interface ViewController ()
{
    ViewControllerModel *model;
    UIAlertView *alert;
}

@property (weak, nonatomic) IBOutlet CLabel *currency;
@property (weak, nonatomic) IBOutlet CLabel *exchangeRate;
@property (weak, nonatomic) IBOutlet CLabel *message;
@property (weak, nonatomic) IBOutlet CLabel *update;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    model = [ViewControllerModel new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (alert == nil) {
        [model loadingDataForTitle:self.currency.text block:^(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update) {
            [self insertData:currency exchangeRate:exchangeRate message:message update:update];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    model = nil;
}

- (IBAction)menuButtonTouch:(id)sender {
    [[[CActionSheet alloc] initWithDelegate:self] showInView:self.view];
}

-(void)didSelectIndex:(NSInteger)index title:(NSString *)title {
    [model loadingDataForTitle:title block:^(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update) {
        [self insertData:currency exchangeRate:exchangeRate message:message update:update];
    }];
}

- (void)insertData:(NSString *)currency exchangeRate:(NSString *)exchangeRate message:(NSString *)message update:(NSString *)update {
    if ([NSString isNilOrEmpty:currency] || [NSString isNilOrEmpty:exchangeRate] ||
        [NSString isNilOrEmpty:message] || [NSString isNilOrEmpty:update]) {
        alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"alert_title_information", nil)
                                           message:NSLocalizedString(@"alert_message_service_not_available", nil)
                                          delegate:self
                                 cancelButtonTitle:@"Ok"
                                 otherButtonTitles:NSLocalizedString(@"alert_button_try_again", nil), nil];
        [alert show];
    } else {
        self.currency.text = currency;
        self.exchangeRate.text = exchangeRate;
        self.message.text = message;
        self.update.text = update;
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        [model loadingDataForTitle:self.currency.text block:^(NSString *currency, NSString *exchangeRate, NSString *message, NSString *update) {
            [self insertData:currency exchangeRate:exchangeRate message:message update:update];
        }];
    }
}

@end
