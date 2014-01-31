//
//  ModeSelectViewController.m
//  Tababooboo
//
//  Created by Flora on 12/30/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "ModeSelectViewController.h"
#import "Constants.h"

@interface OptButton : UIButton
@property bool teamMode;
@end

@implementation OptButton

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

@property OptButton *practiceButton;
@property OptButton *teamButton;
@property bool selectedOption;

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
    [self addSwipeBack];
}

- (void)addSwipeBack
{
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goBack)];
    swipeGesture.direction = (UISwipeGestureRecognizerDirectionRight);
    [self.view addGestureRecognizer:swipeGesture];
}

- (OptButton *) createOption
{
    OptButton *optButton = [OptButton buttonWithType:UIButtonTypeRoundedRect];
    optButton.translatesAutoresizingMaskIntoConstraints = NO;
    optButton.backgroundColor = PrimaryButtonBackgroundColor;
    [optButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    optButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    optButton.titleLabel.font = [UIFont systemFontOfSize:InfiniteFontSize];
    optButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    optButton.titleLabel.minimumScaleFactor = 0.1;
    optButton.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [optButton addTarget:self action:@selector(setGameMode:) forControlEvents:UIControlEventTouchUpInside];
    
    return optButton;
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
    
    NSDictionary *viewDict = @{
                               @"optionsView": optionsView,
                               @"prac": self.practiceButton,
                               @"team": self.teamButton,
                               };
    
    // Position the options within the option view
    NSArray *constraintStrs = @[@"|[prac]|", @"|[team]|", @"V:|[prac]", @"V:[team]|"];
    for (NSString *s in constraintStrs) {
        [optionsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:s
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewDict]];
    }
    // Make all the options 25% the height of the option view
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.practiceButton
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.20
                                                             constant:0]];
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.teamButton
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.20
                                                             constant:0]];
    // Position the optionsView container
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:optionsView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.5
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:optionsView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:optionsView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:optionsView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
}

- (void)setGameMode:(id)sender
{
    OptButton *buttonClicked = (OptButton *)sender;
    self.teamMode = buttonClicked.teamMode;
    self.practiceButton.backgroundColor = PrimaryButtonBackgroundColor;
    self.teamButton.backgroundColor = PrimaryButtonBackgroundColor;
    buttonClicked.backgroundColor = PrimarySelectedButtonBackgroundColor;
    self.selectedOption = true;
    [self playAction];
}

- (void)playAction
{
    [self.delegate switchToSelectTimeController];
}

/*
- (void)addBackButton
{
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.frame = CGRectMake(10, self.view.frame.size.height-50.0, 100.0, 30.0);
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    self.backButton.backgroundColor = PrimaryButtonBackgroundColor;
    [self.backButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal ];
    [self.backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backButton];
}
*/

- (void)goBack
{
    [self.delegate goBack];
}

/*
- (void)addNextScreenButton
{
    self.nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.nextButton.frame = CGRectMake(self.view.frame.size.width-100.0, self.view.frame.size.height-50.0, 100.0, 30.0);
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    self.nextButton.backgroundColor = PrimaryButtonBackgroundColor;
    [self.nextButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    // TODO: customize UI components (styling for buttons, etc)
    [self.nextButton addTarget:self action:@selector(nextScreen) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
}
*/

/*
- (void)nextScreen
{
    if (self.selectedOption) {
        [self.delegate switchToSelectTimeController];
    } else {
        NSLog(@"Error: Select a play mode.");
    }
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
