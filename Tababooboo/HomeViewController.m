//
//  HomeViewController.m
//  Tababooboo
//
//  Created by Flora on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [self createButtons];
    
    //[self addPlayButton];
    //[self addRulesButton];
}

- (void)createButtons {
    // Create a container for the buttons.
    UIView *buttonView = [[UIView alloc] init];
    buttonView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self createPlayButton];
    [self createRulesButton];

    [buttonView addSubview: self.playButton];
    [buttonView addSubview: self.rulesButton];
    self.playButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.rulesButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Add AutoLayout constraints
    NSDictionary *viewsDict = @{@"play": self.playButton, @"rules": self.rulesButton, @"buttonView": buttonView};
    NSArray *strConstraints = @[@"V:|-[play]-80-[rules]-|", @"V:[play(==rules)]", @"H:|-[play]-|", @"H:|-[rules]-|"];
    for (NSString *s in strConstraints) {
        [buttonView addConstraints: [NSLayoutConstraint
                                     constraintsWithVisualFormat: s
                                     options: 0
                                     metrics: nil
                                     views: viewsDict]];
    }
    
    self.playButton.titleLabel.font = self.rulesButton.titleLabel.font;
    
    [self.view addSubview:buttonView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.5
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0.5
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0]];
}

// Creates a blank button with alot of the style attributes that
// we want for the home view.
- (UIButton *) createButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.backgroundColor = PrimaryButtonBackgroundColor;
    [button setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:200];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleLabel.minimumScaleFactor = 0.1;
    button.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    return button;
}

- (UIButton *) createPlayButton
{
    self.playButton = [self createButton];
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    return self.playButton;
}

- (void)playAction
{
    [self.delegate switchToSelectTimeController];
}

- (UIButton *)createRulesButton
{
    self.rulesButton = [self createButton];
    [self.rulesButton setTitle:@"How to Play" forState:UIControlStateNormal];
    [self.rulesButton setTitleColor:SecondaryHeaderColor forState:UIControlStateNormal];
    [self.rulesButton addTarget:self action:@selector(rulesAction) forControlEvents:UIControlEventTouchUpInside];
    return self.rulesButton;
}

- (void)rulesAction
{
    // placeholder for now
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
