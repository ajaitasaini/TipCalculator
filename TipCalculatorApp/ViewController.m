//
//  ViewController.m
//  TipCalculatorApp
//
//  Created by Ajaita Saini on 6/26/18.
//  Copyright © 2018 Ajaita Saini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
//@property (weak, nonatomic) IBOutlet UISlider *sliderTipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipsLabel.alpha = 0;
    self.totalLabel.alpha = 0;
    self.tipControl.alpha = 0;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing:YES];
    
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipsLabel.text = [NSString stringWithFormat:@"+  $%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"=  $%.2f", total];
    
}
- (IBAction)onEditingBegan:(id)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y - 120, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipsLabel.alpha = 1;
        self.totalLabel.alpha = 1;
        self.tipControl.alpha = 1;
    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 120;
    
    [UIView animateWithDuration:0.2 animations:^{
       self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 120, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tipsLabel.alpha = 0;
        self.totalLabel.alpha = 0;
        self.tipControl.alpha = 0;
    }];
    
}
@end
