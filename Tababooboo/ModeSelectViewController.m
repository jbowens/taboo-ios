//
//  ModeSelectViewController.m
//  Tababooboo
//
//  Created by Flora on 12/30/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "ModeSelectViewController.h"
#import "Constants.h"

@interface OptionButton : UIButton
@property bool teamMode;
@end

@implementation OptionButton

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

@end

@interface ModeSelectViewController ()

@property OptionButton *practiceButton;
@property OptionButton *teamButton;

@end

@implementation ModeSelectViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.navigationItem.hidesBackButton = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = PrimaryBackgroundColor;
    [self addOptionButtons];
}

- (OptionButton *) createOption
{
    OptionButton *optionButton = [OptionButton buttonWithType:UIButtonTypeRoundedRect];
    optionButton.translatesAutoresizingMaskIntoConstraints = NO;
    optionButton.backgroundColor = PrimaryButtonBackgroundColor;
    [optionButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    optionButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    optionButton.titleLabel.font = [UIFont systemFontOfSize:InfiniteFontSize];
    optionButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    optionButton.titleLabel.minimumScaleFactor = 0.1;
    optionButton.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [optionButton addTarget:self action:@selector(setGameMode:) forControlEvents:UIControlEventTouchUpInside];
    
    return optionButton;
}

- (void)addOptionButtons
{
    UIView *optionsView = [[UIView alloc] init];
    optionsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // setting up option 1 button
    self.practiceButton = [self createOption];
    [self.practiceButton setTitle:@"Practice" forState:UIControlStateNormal];
    self.practiceButton.teamMode = false;
    [optionsView addSubview:self.practiceButton];
    
    // setting up option 2 button
    self.teamButton = [self createOption];
    [self.teamButton setTitle:@"Make Teams" forState:UIControlStateNormal];
    self.teamButton.teamMode = true;
    [optionsView addSubview:self.teamButton];
    
    [self.view addSubview:optionsView];
    
    /** NSDictionary *viewDict = @{
                               @"optionsView": optionsView,
                               @"prac": self.practiceButton,
                               @"team": self.teamButton,
                               };
    */
}

- (void)setGameMode:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
