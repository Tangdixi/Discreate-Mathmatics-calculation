//
//  ResultViewController.h
//  Calculation
//
//  Created by Developer C on 11/30/12.
//  Copyright (c) 2012 Developer C. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *firstResult;
@property (strong, nonatomic) IBOutlet UILabel *secondResult;
@property (strong, nonatomic) IBOutlet UILabel *thirdResult;
@property (strong, nonatomic) IBOutlet UILabel *forthResult;

@property (strong, nonatomic) NSDictionary *eachResult;

@property (strong, nonatomic) IBOutlet UILabel *last;
@end
