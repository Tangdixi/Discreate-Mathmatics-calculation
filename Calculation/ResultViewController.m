//
//  ResultViewController.m
//  Calculation
//
//  Created by Developer C on 11/30/12.
//  Copyright (c) 2012 Developer C. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController
@synthesize firstResult,secondResult,thirdResult,forthResult;
@synthesize eachResult,last;

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
    
    
    firstResult.text=[eachResult objectForKey:@"1"];
    secondResult.text=[eachResult objectForKey:@"2"];
    thirdResult.text=[eachResult objectForKey:@"3"];
    forthResult.text=[eachResult objectForKey:@"4"];
    
    for (int i=1; i<5; i++) {
        NSString *format=[NSString stringWithFormat:@"%d",i];
        NSString *a=[eachResult objectForKey:format];
        if ([a isEqualToString:@"≠"]) {
            last.text=@"Wrong !!";
            break;
        }
    }
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
