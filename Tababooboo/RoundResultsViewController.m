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
@property UIScrollView *wordsView;

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
    self.teamLabel.adjustsFontSizeToFitWidth = YES;
    self.teamLabel.font = GuessWordFont;
    self.teamLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    self.teamLabel.numberOfLines = 2;
    [self.view addSubview:self.teamLabel];
    
    // TODO : abstract out repeated code (like center) into a UIViewController interface
    [self center:self.teamLabel];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[w]-|" options:0 metrics:nil views:@{@"w": self.teamLabel}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.teamLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.teamLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                        multiplier:TeamNameHeightAsPct
                                                           constant:0]];
    self.wordsView = [[UIScrollView alloc] init];
    self.wordsView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.wordsView];
    
    [self center:self.wordsView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordsView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:TeamNameHeightAsPct
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordsView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.teamLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordsView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.teamLabel
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:0.70
                                                           constant:0]];
    int wordListCount = [self.currRound.wordList count];
    for (int i = 0; i < wordListCount; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.adjustsFontSizeToFitWidth = YES;
        label.font = ProhibitedWordsFont;
        label.textColor = ProhibitedWordsColor;
        label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = [self.currRound getWordResultWord:i];
    }
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
