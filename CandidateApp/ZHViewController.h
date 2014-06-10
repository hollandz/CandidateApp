//
//  ZHViewController.h
//  CandidateApp
//
//  Created by Zae Holland on 6/5/14.
//  Copyright (c) 2014 ZH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>



@interface ZHViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    
    BOOL checked1;
    BOOL checked2;
    BOOL checked3;
    BOOL checked4;
    BOOL checked5;
    BOOL checked6;
    BOOL checked7;
    BOOL checked8;
    BOOL checked9;
    
   
}


@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UILabel *label4;
@property (weak, nonatomic) IBOutlet UILabel *label5;
@property (weak, nonatomic) IBOutlet UILabel *label6;
@property (weak, nonatomic) IBOutlet UILabel *label7;
@property (weak, nonatomic) IBOutlet UILabel *label8;
@property (weak, nonatomic) IBOutlet UILabel *label9;


@property (weak, nonatomic) IBOutlet UIButton *checkBox1;
@property (weak, nonatomic) IBOutlet UIButton *checkBox2;
@property (weak, nonatomic) IBOutlet UIButton *checkBox3;
@property (weak, nonatomic) IBOutlet UIButton *checkBox4;
@property (weak, nonatomic) IBOutlet UIButton *checkBox5;
@property (weak, nonatomic) IBOutlet UIButton *checkBox6;
@property (weak, nonatomic) IBOutlet UIButton *checkBox7;
@property (weak, nonatomic) IBOutlet UIButton *checkBox8;
@property (weak, nonatomic) IBOutlet UIButton *checkBox9;

@property (weak, nonatomic) IBOutlet UILabel *label1a;
@property (weak, nonatomic) IBOutlet UILabel *label2a;
@property (weak, nonatomic) IBOutlet UILabel *label3a;
@property (weak, nonatomic) IBOutlet UILabel *label4a;
@property (weak, nonatomic) IBOutlet UILabel *label5a;
@property (weak, nonatomic) IBOutlet UILabel *label6a;
@property (weak, nonatomic) IBOutlet UILabel *label7a;
@property (weak, nonatomic) IBOutlet UILabel *label8a;
@property (weak, nonatomic) IBOutlet UILabel *label9a;

@property NSArray* cost;
@property NSArray* name;
@property NSString* messageBody;
@property NSString* part0;
@property NSString* part1;
@property NSString* part2;
@property NSString* part3;
@property NSString* part4;
@property NSString* part5;
@property NSString* part6;
@property NSString* part7;
@property NSString* part8;
@property NSString* part9;
@property NSString* totalCost;



- (IBAction)emailButton:(id)sender;

@property (nonatomic) long total;

- (IBAction)checkButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *emailAddress;

//arrays
@property (nonatomic, strong) NSArray *bodyTypeArray;
@property (nonatomic, strong) NSArray *decorationArray;
@property (nonatomic, strong) NSArray *wheelsArray;

@property (weak, nonatomic) IBOutlet UILabel *totalCostLabel;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;


@end
