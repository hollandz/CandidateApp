//
//  ZHViewController.m
//  CandidateApp
//
//  Created by Zae Holland on 6/5/14.
//  Copyright (c) 2014 ZH. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHViewController ()



@end

@implementation ZHViewController

@synthesize checkBox1;
@synthesize checkBox2;
@synthesize checkBox3;
@synthesize checkBox4;
@synthesize checkBox5;
@synthesize checkBox6;
@synthesize checkBox7;
@synthesize checkBox8;
@synthesize checkBox9;
@synthesize total;
@synthesize totalCostLabel;
@synthesize cost;
@synthesize name;
@synthesize messageBody;
@synthesize part0;
@synthesize part1;
@synthesize part2;
@synthesize part3;
@synthesize part4;
@synthesize part5;
@synthesize part6;
@synthesize part7;
@synthesize part8;
@synthesize totalCost;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    checked1 = [defaults boolForKey:@"box1IsChecked"];
    checked2 = [defaults boolForKey:@"box2IsChecked"];
    checked3 = [defaults boolForKey:@"box3IsChecked"];
    checked4 = [defaults boolForKey:@"box4IsChecked"];
    checked5 = [defaults boolForKey:@"box5IsChecked"];
    checked6 = [defaults boolForKey:@"box6IsChecked"];
    checked7 = [defaults boolForKey:@"box7IsChecked"];
    checked8 = [defaults boolForKey:@"box8IsChecked"];
    checked9 = [defaults boolForKey:@"box9IsChecked"];
    total = [defaults integerForKey:@"total"];
    totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
    
    [self checkTheBox];

    
    //Import json data in background
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        NSData* partsData = [NSData dataWithContentsOfURL:
                             [NSURL URLWithString:@"http://cms.assets.mobilesmith.com/parts.json"]
                             ];
        
        NSDictionary* json =nil;
        if (partsData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:partsData options:kNilOptions error:nil];
        }

        dispatch_async(dispatch_get_main_queue(),^{
            [self updateUIWithDictionary: json];
        });
        
    });
    
   
    
    //_bodyTypeArray = [[NSArray alloc] initWithObjects:@"Wedge", @"Aerodynamic", @"Box", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






-(void)updateUIWithDictionary:(NSDictionary*)json {
    
    @try {
        
        cost = [NSArray arrayWithObjects:
                json[@"Parts"][@"Body Type"][0][@"cost"],
                json[@"Parts"][@"Body Type"][1][@"cost"],
                json[@"Parts"][@"Body Type"][2][@"cost"],
                json[@"Parts"][@"Decoration"][0][@"cost"],
                json[@"Parts"][@"Decoration"][1][@"cost"],
                json[@"Parts"][@"Decoration"][2][@"cost"],
                json[@"Parts"][@"Wheels"][0][@"cost"],
                json[@"Parts"][@"Wheels"][1][@"cost"],
                json[@"Parts"][@"Wheels"][2][@"cost"],
                nil];
        name = [NSArray arrayWithObjects:
                json[@"Parts"][@"Body Type"][0][@"name"],
                json[@"Parts"][@"Body Type"][1][@"name"],
                json[@"Parts"][@"Body Type"][2][@"name"],
                json[@"Parts"][@"Decoration"][0][@"name"],
                json[@"Parts"][@"Decoration"][1][@"name"],
                json[@"Parts"][@"Decoration"][2][@"name"],
                json[@"Parts"][@"Wheels"][0][@"name"],
                json[@"Parts"][@"Wheels"][1][@"name"],
                json[@"Parts"][@"Wheels"][2][@"name"],
                nil];
                

        
        
                
        
        
        _label1.text = [name objectAtIndex: 0];
        _label1a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex: 0]intValue], nil];
                          
        _label2.text = [name objectAtIndex: 1];
        _label2a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:1] intValue], nil];
        
        _label3.text = [name objectAtIndex: 2];
        _label3a.text =[NSString stringWithFormat: @"$%d",[[cost objectAtIndex:2] intValue], nil];
        
        _label4.text = [name objectAtIndex: 3];
        _label4a.text =[NSString stringWithFormat: @"$%d",[[cost objectAtIndex:3] intValue], nil];
        
        _label5.text = [name objectAtIndex: 4];
        _label5a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:4] intValue], nil];
        
        _label6.text = [name objectAtIndex: 5];
        _label6a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:5] intValue], nil];
        
        _label7.text = [name objectAtIndex: 6];
        _label7a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:6] intValue], nil];
        
        _label8.text = [name objectAtIndex: 7];
        _label8a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:7] intValue], nil];
        
        _label9.text = [name objectAtIndex: 8];
        _label9a.text = [NSString stringWithFormat: @"$%d",[[cost objectAtIndex:8] intValue], nil];
        
        }
    
    
    @catch (NSException *exception) {
        [[[UIAlertView alloc] initWithTitle:@"Error"
                                    message:@"Could not parse the JSON feed."
                                   delegate:nil
                          cancelButtonTitle:@"Close"
                          otherButtonTitles: nil] show];
        NSLog(@"Exception: %@", exception);
    }
    

}

- (IBAction)checkButton:(id)sender {
    if ([sender tag] == 0) {
        NSLog(@"button 1");
        
        if (checked1) {
            [self uncheckBox:0];
            [self decreaseTotal:0];
        }
        else if (!checked1) {
            [self checkBox:0];
            [self increaseTotal:0];
        }
    }
    if ([sender tag] == 1) {
        NSLog(@"button 2");
        if (checked2) {
            [self uncheckBox:1];
            [self decreaseTotal:1];
        }
        else if (!checked2) {
            [self checkBox:1];
            [self increaseTotal:1];
        }
    }
    if ([sender tag] == 2) {
        NSLog(@"button 3");
        if (checked3) {
            [self uncheckBox:2];
            [self decreaseTotal:2];
        }
        else if (!checked3) {
            [self checkBox:2];
            [self increaseTotal:2];
        }
    }
    if ([sender tag] == 3) {
        NSLog(@"button 4");
        if (checked4) {
            [self uncheckBox:3];
            [self decreaseTotal:3];
        }
        else if (!checked4) {
            [self checkBox:3];
            [self increaseTotal:3];
        }
    }
    
    if ([sender tag] == 4) {
        NSLog(@"button 5");
        if (checked5) {
            [self uncheckBox:4];
            [self decreaseTotal:4];
        }
        else if (!checked5) {
            [self checkBox:4];
            [self increaseTotal:4];
        }
    }
    if ([sender tag] == 5) {
        NSLog(@"button 6");
        if (checked6) {
            [self uncheckBox:5];
            [self decreaseTotal:5];
        }
        else if (!checked6) {
            [self checkBox:5];
            [self increaseTotal:5];
        }
    }
    if ([sender tag] == 6) {
        NSLog(@"button 7");
        if (checked7) {
            [self uncheckBox:6];
            [self decreaseTotal:6];
            
        }
        else if (!checked7) {
            [self checkBox:6];
            [self increaseTotal:6];
        }
    }
    
    if ([sender tag] == 7) {
        NSLog(@"button 8");
        if (checked8) {
            [self uncheckBox:7];
            [self decreaseTotal:7];
        }
        else if (!checked8) {
            [self checkBox:7];
            [self increaseTotal:7];
        }
    }
    if ([sender tag] == 8) {
        NSLog(@"button 9");
        if (checked9) {
            [self uncheckBox:8];
            [self decreaseTotal:8];
        }
        else if (!checked9) {
            [self checkBox:8];
            [self increaseTotal:8];
        }
    }
    
}



- (void) checkBox:(int)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (sender == 0) {
        [checkBox1 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box1IsChecked"];
        NSLog(@"button 1 is checked");
        checked1 = YES;
    }
    if (sender == 1) {
        [checkBox2 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box2IsChecked"];
        checked2 = YES;
    }
    if (sender == 2) {
        [checkBox3 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box3IsChecked"];
        checked3 = YES;
    }
    if (sender == 3) {
        [checkBox4 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box4IsChecked"];
        checked4 = YES;
    }
    
    if (sender == 4) {
        [checkBox5 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box5IsChecked"];
         checked5 = YES;
    }
    if (sender == 5) {
        [checkBox6 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box6IsChecked"];
        checked6 = YES;
    }
    if (sender == 6) {
        [checkBox7 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box7IsChecked"];
        checked7 = YES;
    }
    if (sender == 7) {
        [checkBox8 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box8IsChecked"];
        checked8 = YES;
    }
    
    if (sender == 8) {
        [checkBox9 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
        [defaults setBool:YES forKey:@"box9IsChecked"];
        checked9 = YES;
    }
    
    [defaults synchronize];
}



- (void) uncheckBox:(int) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (sender == 0) {
        [checkBox1 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box1IsChecked"];
        NSLog(@"button 1 is unchecked");
        checked1 = NO;
    }
    if (sender == 1) {
        [checkBox2 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box2IsChecked"];
        checked2 = NO;
    }
    if (sender == 2) {
        [checkBox3 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box3IsChecked"];
        checked3 = NO;
    }
    if (sender == 3) {
        [checkBox4 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box4IsChecked"];
        checked4 = NO;
    }
    
    if (sender == 4) {
        [checkBox5 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box5IsChecked"];
        checked5 = NO;
    }
    
    if (sender == 5) {
        [checkBox6 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box6IsChecked"];
        checked6 = NO;
    }
    
    if (sender == 6) {
        [checkBox7 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box7IsChecked"];
        checked7 = NO;
    }
    
    if (sender == 7) {
        [checkBox8 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box8IsChecked"];
        checked8 = NO;
    }
    
    if (sender == 8) {
        [checkBox9 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
        [defaults setBool:NO forKey:@"box9IsChecked"];
        checked9 = NO;
    }



    
    [defaults synchronize];
}


- (void) checkTheBox {
    
    if (!checked1) {
        [checkBox1 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked1) {
        [checkBox1 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked2) {
        [checkBox2 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked2) {
        [checkBox2 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked3) {
        [checkBox3 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked3) {
        [checkBox3 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked4) {
        [checkBox4 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked4) {
        [checkBox4 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked5) {
        [checkBox5 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked5) {
        [checkBox5 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked6) {
        [checkBox6 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked6) {
        [checkBox6 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked7) {
        [checkBox7 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked7) {
        [checkBox7 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked8) {
        [checkBox8 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked8) {
        [checkBox8 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
    
    if (!checked9) {
        [checkBox9 setImage:[UIImage imageNamed:@"checkBox.png"] forState:UIControlStateNormal];
    }
    
    else if (checked9) {
        [checkBox9 setImage:[UIImage imageNamed:@"checkBoxMarked.png"] forState:UIControlStateNormal];
    }
}

- (void) increaseTotal:(int)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (sender == 0) {
        total = total + [[cost objectAtIndex:0] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

        
    }
    if (sender == 1) {
        total = total + [[cost objectAtIndex:1] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 2) {
        total = total + [[cost objectAtIndex:2] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 3) {
        total = total + [[cost objectAtIndex:3] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    if (sender == 4) {
        total = total + [[cost objectAtIndex:4] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 5) {
        total = total + [[cost objectAtIndex:5] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 6) {
        total = total + [[cost objectAtIndex:6] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 7) {
        total = total + [[cost objectAtIndex:7] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    if (sender == 8) {
        total = total + [[cost objectAtIndex:8] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    [defaults synchronize];
}

- (void) decreaseTotal:(int)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    

    if (sender == 0) {
        total = total - [[cost objectAtIndex:0] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 1) {
        total = total - [[cost objectAtIndex:1] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 2) {
        total = total - [[cost objectAtIndex:2] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 3) {
        total = total - [[cost objectAtIndex:3] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    if (sender == 4) {
        total = total - [[cost objectAtIndex:4] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 5) {
        total = total - [[cost objectAtIndex:5] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 6) {
        total = total - [[cost objectAtIndex:6] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    if (sender == 7) {
        total = total - [[cost objectAtIndex:7] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    if (sender == 8) {
        total = total - [[cost objectAtIndex:8] intValue];
        totalCostLabel.text = [NSString stringWithFormat: @"$%ld",total, nil];
        [defaults setInteger:total forKey:@"total"];

    }
    
    [defaults synchronize];
}


- (IBAction)emailButton:(id)sender {
    
    messageBody = @"You ordered:\n";
        
        if (checked1) {
            part0 = [NSString stringWithFormat: @"%@\n",[name objectAtIndex:0]];
            messageBody = [messageBody stringByAppendingString:part0];
        
        }
    
    
        if (checked2) {
            part1 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:1]];
            messageBody = [messageBody stringByAppendingString:part1];        }
    
        if (checked3) {
            part2 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:2]];
            messageBody = [messageBody stringByAppendingString:part2];        }
    
    
        if (checked4) {
            part3 = [NSString stringWithFormat: @"%@\n",[name objectAtIndex:3]];
            messageBody = [messageBody stringByAppendingString:part3];
        }
    
        if (checked5) {
            part4 = [NSString stringWithFormat: @"%@\n",[name objectAtIndex:4]];
            messageBody = [messageBody stringByAppendingString:part4];
        }
    
        if (checked6) {
            part5 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:5]];
            messageBody = [messageBody stringByAppendingString:part5];
        }
    
    
        if (checked7) {
            part6 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:6]];
            messageBody = [messageBody stringByAppendingString:part6];
        }
    
   
        if (checked8) {
            part7 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:7]];
            messageBody = [messageBody stringByAppendingString:part7];
        }
    

        if (checked9) {
            part8 = [NSString stringWithFormat: @"%@\n", [name objectAtIndex:8]];
            messageBody = [messageBody stringByAppendingString:part8];
        }

    totalCost = [NSString stringWithFormat: @"\nYour total cost is: $%ld", total, nil];
    messageBody = messageBody = [messageBody stringByAppendingString:totalCost];
    

    
    
    // Email Subject
    NSString *emailSubject = @"Rally Car ";
    // Email Content
    //NSString *messageBody = [NSString stringWithFormat: @"Your total cost is %d",total, nil];;
    
    
    
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"support@derbydesigner.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailSubject];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
