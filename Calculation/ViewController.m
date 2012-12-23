//
//  ViewController.m
//  Calculation
//
//  Created by Developer C on 11/27/12.
//  Copyright (c) 2012 Developer C. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *pointFirst;
@property (strong, nonatomic) IBOutlet UIButton *pointSecond;
@property (strong, nonatomic) IBOutlet UIButton *pointThird;
@property (strong, nonatomic) IBOutlet UIButton *pointForth;

@property (strong, nonatomic) IBOutlet UIButton *starFirst;
@property (strong, nonatomic) IBOutlet UIButton *starSecond;
@property (strong, nonatomic) IBOutlet UIButton *starThird;
@property (strong, nonatomic) IBOutlet UIButton *starForth;

- (NSInteger)pointCalculateElement:(NSString*)A withElement:(NSString*)B;
- (NSInteger)starCalculateElement:(NSString*)A withElement:(NSString*)B;

@end

@implementation ViewController
@synthesize stem;
@synthesize alterString=_alterString;
@synthesize pointFirst,pointSecond,pointThird,pointForth,buttons;
@synthesize starFirst,starSecond,starThird,starForth;
@synthesize titleValue;
@synthesize finalResultLabel,finalResult;
@synthesize selectedIndex;
@synthesize rule;
@synthesize results;
@synthesize passResult;

- (void)viewDidLoad
{
    [super viewDidLoad];
    stem.delegate=self;
    self.finalResultLabel.text=nil;
    
    NSArray *pointButtons=[NSArray arrayWithObjects:pointFirst,pointSecond,pointThird,pointForth,starFirst,starSecond,starThird,starForth, nil];
    self.buttons=pointButtons;
    
    NSMutableArray *temp=[NSMutableArray arrayWithObjects:@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0", nil];
    self.rule=temp;
    
    NSMutableArray *allResults=[NSMutableArray arrayWithObject:@" "];
    self.results=allResults;
    
    NSMutableArray *tempPass=[NSMutableArray arrayWithObjects:@" ", nil];
    self.passResult=tempPass;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Judge the formular Method

- (void)judge{
    NSString *firstLawPartOne=@"(1⊛(0⊙1))";
    NSString *firstLawPartTwo=@"((1⊛0)⊙(1⊛1))";
    NSString *firstLawPartThree=@"((0⊙1)⊛1)";
    NSString *firstLawPartFour=@"((0⊛1)⊙(1⊛1))";
    
    NSString *secondLawPartOne=@"(1⊙(0⊛1))";
    NSString *secondLawPartTwo=@"((1⊙0)⊛(1⊙1))";
    NSString *secondLawPartThree=@"((0⊛1)⊙1)";
    NSString *secondLawPartFour=@"((0⊙1)⊛(1⊙1))";
    
    [self core:firstLawPartOne];
    [self core:firstLawPartTwo];
    [self core:firstLawPartThree];
    [self core:firstLawPartFour];
    
    [self core:secondLawPartOne];
    [self core:secondLawPartTwo];
    [self core:secondLawPartThree];
    [self core:secondLawPartFour];
}

- (void)analyseResults{
    [self.passResult removeAllObjects];
    for (int i=0; i<8; i+=2) {
        NSString *a;
        if ([[self.results objectAtIndex:i]isEqualToString:[self.results objectAtIndex:i+1]]) {
            a=@"=";
        }
        else{
            a=@"≠";
        }
        [self.passResult addObject:a];
    }
}

- (IBAction)judge:(id)sender {
    [self.results removeAllObjects];
    [self judge];
    [self analyseResults];
    NSLog(@"%d",[self.results count]);
}

#pragma mark - Core Method

- (void)core:(NSString*)target{
    for (int i=0; i<[target length]; i++) {
        NSRange keyWord=NSMakeRange(i, 1);
        NSRange firstPosition=NSMakeRange(i-3, 1);
        NSRange secondPosition=NSMakeRange(i-1, 1);
        NSRange operatorPosition=NSMakeRange(i-2, 1);
        //NSRange portionRange=NSMakeRange(i-4, 5);
        
        NSString *forEach=[target substringWithRange:keyWord];
        
        NSLog(@"%@",forEach);
        if ([forEach isEqualToString:@")"]) {
            NSString *first=[target substringWithRange:firstPosition];
            NSString *second=[target substringWithRange:secondPosition];
            NSString *operator=[target substringWithRange:operatorPosition];
            
            //NSString *portionString=[self.alterString substringWithRange:portionRange];
            NSString *alterResult=[self alterResultByOperator:operator
                                                  withElement:first andElement:second];
            
            NSRange rebuildHead=NSMakeRange(0, i-4);
            NSRange rebuildFoot=NSMakeRange(i+1, target.length-i-1);
            
            NSString *rebuildHeadString=[target substringWithRange:rebuildHead];
            NSString *rebuildFootString=[target substringWithRange:rebuildFoot];
            target=[[rebuildHeadString  stringByAppendingString:alterResult]   stringByAppendingString:rebuildFootString];
            NSLog(@"%@,%@,%@",rebuildHeadString,rebuildFootString,target);
            self.finalResult=target;
            break;
        }
    }
    if ([target length]>=5) {
        [self core:target];
    }
    if ([target length]==1) {
        [self.results addObject:target];
    }
}

#pragma mark - The Calculation Method

- (NSString*)alterResultByOperator:(NSString*)operator withElement:(NSString*)A andElement:(NSString*)B{
    NSString *result;
    if ([operator isEqualToString:@"⊙"]) {
        result=[NSString stringWithFormat:@"%d",[self pointCalculateElement:A withElement:B]];
    }
    else if ([operator isEqualToString:@"⊛"]){
        result=[NSString stringWithFormat:@"%d",[self starCalculateElement:A withElement:B]];
    }
    return result;
}

- (NSInteger)pointCalculateElement:(NSString*)A withElement:(NSString*)B{
    NSInteger result;
    NSInteger ValueA=[A integerValue];
    NSInteger ValueB=[B integerValue];
    if (ValueA==ValueB) {
        if (ValueA==0) {
            result=[[self.rule objectAtIndex:0] integerValue];
        }
        else{
            result=[[self.rule objectAtIndex:3] integerValue];
        }
    }
    else{
        if (ValueA<ValueB) {
            result=[[self.rule objectAtIndex:1] integerValue];
        }
        else{
            result=[[self.rule objectAtIndex:2] integerValue];
        }
    }
    return result;
}

- (NSInteger)starCalculateElement:(NSString*)A withElement:(NSString*)B{
    NSInteger result;
    NSInteger ValueA=[A integerValue];
    NSInteger ValueB=[B integerValue];
    
    if (ValueA==ValueB) {
        if (ValueA==0) {
            result=[[self.rule objectAtIndex:4] integerValue];
        }
        else if (ValueA==1){
            result=[[self.rule objectAtIndex:7] integerValue];
        }
    }
    else{
        if (ValueA<ValueB) {
            result=[[self.rule objectAtIndex:5] integerValue];
        }
        else{
            result=[[self.rule objectAtIndex:6] integerValue];
        }
    }
    return result;
}

#pragma mark - Text Field Delegate

- (NSString*)convertTag:(id)sender{
    NSString *result;
    if ([sender tag]==0) {
        result=@"1";
        self.stem.textColor=[UIColor redColor];
    }
    else if ([sender tag]==1){
        result=@"0";
        self.stem.textColor=[UIColor redColor];
    }
    else if ([sender tag]==2){
        result=@"(";
    }
    else if ([sender tag]==3){
        result=@")";
    }
    else if ([sender tag]==4){
        result=@"⊙";
    }
    else{
        result=@"⊛";
    }
    return result;
}

- (IBAction)valueDetection:(id)sender {
    self.stem.textColor=[UIColor whiteColor];
    stem.text=[stem.text stringByAppendingString:[self convertTag:sender]];
}

- (IBAction)run:(id)sender {
    [self.stem endEditing:YES];
    self.alterString=stem.text;
    [self core:self.alterString];
    self.finalResultLabel.text=self.finalResult;
    [self judge];
}

- (IBAction)reset:(id)sender {
    self.stem.text=@"";
    self.finalResultLabel.text=@"";
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.alterString=stem.text;
    NSLog(@"%@",self.alterString);
    NSLog(@"test");
}

#pragma mark - Get the table value Method

- (IBAction)pointCalcuilationTableValue:(id)sender {
    selectedIndex=[sender tag];
    [self sheetAppear];
}

- (IBAction)starCalculationTableValue:(id)sender {
    selectedIndex=[sender tag];
    [self sheetAppear];
}

- (void)sheetAppear{
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:@"Create your own table" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Clean" otherButtonTitles:@"1",@"0", nil];
    sheet.actionSheetStyle=UIActionSheetStyleBlackOpaque;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        titleValue=@"?";
    }
    else if (buttonIndex==1){
        titleValue=@"1";
    }
    else if (buttonIndex==2){
        titleValue=@"0";
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    UIButton *button=[self.buttons objectAtIndex:selectedIndex];
    button.titleLabel.text=self.titleValue;
    if ((![self.titleValue isEqualToString:@"?"]) && (buttonIndex!=3)) {
        [rule replaceObjectAtIndex:selectedIndex withObject:self.titleValue];
        NSLog(@"%@,%d",[rule objectAtIndex:selectedIndex],[rule count]);
    }
}

#pragma mark - Segue Method
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController respondsToSelector:@selector(setDelegate:)]) {
        [segue.destinationViewController setValue:self forKey:@"delegate"];
    }
    if ([segue.destinationViewController respondsToSelector:@selector(setEachResult:)]) {
        NSDictionary *dic=[NSDictionary
                           dictionaryWithObjects:self.passResult
                           forKeys:[NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil]];
        [segue.destinationViewController setValue:dic forKey:@"eachResult"];
        for(NSString *str in self.passResult){
            NSLog(@"%@",str);
        }
    }
}

@end
