//
//  ViewController.h
//  Calculation
//
//  Created by Developer C on 11/27/12.
//  Copyright (c) 2012 Developer C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UITextField *stem;
@property (strong, nonatomic) IBOutlet UILabel *finalResultLabel;

@property (strong, nonatomic) NSString *finalResult;
@property (strong, nonatomic) NSString *titleValue;
@property (weak, nonatomic) NSString *alterString;

@property (nonatomic) NSUInteger selectedIndex;
@property (strong, nonatomic) NSArray *buttons;
@property (strong, nonatomic) NSMutableArray *rule;
@property (strong, nonatomic) NSMutableArray *results;
@property (strong ,nonatomic) NSMutableArray *passResult;

- (IBAction)pointCalcuilationTableValue:(id)sender ;
- (IBAction)starCalculationTableValue:(id)sender;

@end
