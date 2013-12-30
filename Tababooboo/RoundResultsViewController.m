//
//  RoundResultsViewController.m
//  Tababooboo
//
//  Created by Flora on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "RoundResultsViewController.h"
#import "Constants.h"

@interface RoundResultsViewController ()

@property UILabel* teamLabel;

@end

@implementation RoundResultsViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self addTeamLabel];
}

- (void)addTeamLabel
{
    self.teamLabel = [[UILabel alloc] init];
    self.teamLabel.text = self.teamName;
    self.teamLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.teamLabel.textAlignment = NSTextAlignmentCenter;
    self.teamLabel.adjustsFontSizeToFitWidth = NO;
    self.teamLabel.font = [UIFont systemFontOfSize:InfiniteFontSize];
    self.teamLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [self.view addSubview:self.teamLabel];
    // TODO : abstract out repeated code (like center) into a UIViewController interface
    [self center:self.teamLabel];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[w]-|" options:0 metrics:nil views:@{@"w": self.teamLabel}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.teamLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                        multiplier:TeamNameHeightAsPct
                                                           constant:0]];
}

- (void) center:(UIView *)view
{
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
