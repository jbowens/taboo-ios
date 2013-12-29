//
//  SelectTimeViewController.m
//  Tababooboo
//
//  Created by Flora on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "SelectTimeViewController.h"
#import "Constants.h"

@interface OptionButton : UIButton
    @property int optionTimeLimit;
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

@interface SelectTimeViewController ()

@property OptionButton *option1Button;
@property OptionButton *option2Button;
@property OptionButton *option3Button;

@end

@implementation SelectTimeViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.selectedTimeLimit = 0;
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
    [self addBackButton];
    [self addStartGameButton];
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
    [optionButton addTarget:self action:@selector(setTimeLimit:) forControlEvents:UIControlEventTouchUpInside];
    
    return optionButton;
}

- (void)addOptionButtons
{
    UIView *optionsView = [[UIView alloc] init];
    optionsView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // setting up option 1 button
    self.option1Button = [self createOption];
    [self.option1Button setTitle:@"60 seconds" forState:UIControlStateNormal];
    self.option1Button.optionTimeLimit = 60;
    [optionsView addSubview:self.option1Button];
    
    // setting up option 2 button
    self.option2Button = [self createOption];
    [self.option2Button setTitle:@"90 seconds" forState:UIControlStateNormal];
    self.option2Button.optionTimeLimit = 90;
    [optionsView addSubview:self.option2Button];
    
    // setting up option 3 button
    self.option3Button = [self createOption];
    [self.option3Button setTitle:@"120 seconds" forState:UIControlStateNormal];
    self.option3Button.optionTimeLimit = 120;
    [optionsView addSubview:self.option3Button];
    
    [self.view addSubview:optionsView];
    
    
    NSDictionary *viewDict = @{
                               @"optionsView": optionsView,
                                       @"one": self.option1Button,
                                       @"two": self.option2Button,
                                     @"three": self.option3Button
                              };
    
    // Position the options within the option view
    NSArray *constraintStrs = @[@"|[one]|", @"|[two]|", @"|[three]|", @"V:|[one]", @"V:[three]|"];
    for (NSString *s in constraintStrs) {
        [optionsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:s
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewDict]];
    }
    // Make all the options 25% the height of the option view
    
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.option1Button
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.25
                                                             constant:0]];
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.option2Button
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.25
                                                             constant:0]];
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.option3Button
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.25
                                                             constant:0]];
    // Make the second object centered in the middle
    
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.option2Button
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.0
                                                             constant:0]];
    [optionsView addConstraint:[NSLayoutConstraint constraintWithItem:self.option2Button
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:optionsView
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.0
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

- (void)setTimeLimit:(id)sender
{
    OptionButton *buttonClicked = (OptionButton *)sender;
    self.selectedTimeLimit = buttonClicked.optionTimeLimit;
    self.option1Button.backgroundColor = PrimaryButtonBackgroundColor;
    self.option2Button.backgroundColor = PrimaryButtonBackgroundColor;
    self.option3Button.backgroundColor = PrimaryButtonBackgroundColor;
    buttonClicked.backgroundColor = PrimarySelectedButtonBackgroundColor;
}

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

- (void)goBack
{
    [self.delegate goBack];
}

- (void)addStartGameButton
{
    self.startGameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.startGameButton.frame = CGRectMake(self.view.frame.size.width-100.0, self.view.frame.size.height-50.0, 100.0, 30.0);
    [self.startGameButton setTitle:@"Start" forState:UIControlStateNormal];
    self.startGameButton.backgroundColor = PrimaryButtonBackgroundColor;
    [self.startGameButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    // TODO: customize UI components (styling for buttons, etc)
    [self.startGameButton addTarget:self action:@selector(startGame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startGameButton];
}

- (void)startGame
{
    if (self.selectedTimeLimit != 0) {
        [self.delegate switchToGameController];
    } else {
        NSLog(@"Error: Select a time limit.");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
