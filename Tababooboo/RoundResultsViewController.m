//
//  RoundResultsViewController.m
//  Tababooboo
//
//  Created by Flora on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "RoundResultsViewController.h"
#import "Constants.h"
#import "WordResult.h"

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
    [self setupUI];
}

- (void)setupUI
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
    self.wordsView.delegate = self;
    self.wordsView.translatesAutoresizingMaskIntoConstraints = NO;
    self.wordsView.scrollEnabled = YES;
    self.wordsView.showsVerticalScrollIndicator = YES;
    self.wordsView.userInteractionEnabled = YES;
    [self.view addSubview:self.wordsView];
    
    [self center:self.wordsView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordsView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:ResultWordsHeightAsPct
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
                                                         multiplier:1
                                                           constant:0]];
    int wordListCount = (int) [self.currRound.wordList count];
    
    // TODO : Copy and pasted all this from GameViewController, which is probably bad OH WELL
    
    UILabel *firstLabel = nil;
    UILabel *prevLabel = nil;
    
    for (int i = 0; i < wordListCount; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.adjustsFontSizeToFitWidth = YES;
        label.font = ProhibitedWordsFont;
        label.textColor = SkippedWordColor;
        label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 2;
        WordResult* wr = [self.currRound.wordList objectAtIndex:i];
        label.text = wr.word.word;
        if (wr.correct) {
            label.textColor = CorrectWordColor;
        }
        [self.wordsView addSubview:label];
        [self.wordsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[w]|" options:0 metrics:nil views:@{@"w": label}]];
        [self.wordsView addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.wordsView
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1.0
                                                                    constant:0]];
        [self.wordsView addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.wordsView attribute:NSLayoutAttributeHeight multiplier:1.0f/wordListCount constant:-1]];
        
        if (!prevLabel) {
            firstLabel = label;
            // This is the first label. We need to make a constraint against the top of its container.
            [self.wordsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[w]" options:0 metrics:nil views:@{@"w": label}]];
        } else {
            // There was a label before us. We need to add constraints to position this label in relation to that label.
            [self.wordsView addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:prevLabel
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1.0
                                                                             constant:0]];
            // This label must also be the same height as the previous label.
            [self.wordsView addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:firstLabel
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0
                                                                             constant:0]];
        }
        prevLabel = label;
    }
    // For the last label, we want it to be flush against the bottom of the container
    [self.wordsView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[w]|" options: 0 metrics:nil views:@{@"w": prevLabel}]];
    
    UIView *buttonBar = [[UIView alloc] init];
    buttonBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:buttonBar];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bar]|" options:0 metrics:nil views:@{@"bar": buttonBar}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]|" options:0 metrics:nil views:@{@"bar": buttonBar}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.2 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordsView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:buttonBar attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    UIButton *nextRoundButton = [[UIButton alloc] init];
    nextRoundButton.backgroundColor = PrimaryButtonBackgroundColor;
    [nextRoundButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    nextRoundButton.translatesAutoresizingMaskIntoConstraints = NO;
    nextRoundButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    nextRoundButton.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [nextRoundButton setTitle:@"Next round" forState:UIControlStateNormal];
    [buttonBar addSubview:nextRoundButton];
    [buttonBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[b]|" options:0 metrics:nil views:@{@"b": nextRoundButton}]];
    [buttonBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[b]|" options:0 metrics:nil views:@{@"b": nextRoundButton}]];
    [buttonBar addConstraint:[NSLayoutConstraint constraintWithItem:nextRoundButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:buttonBar attribute:NSLayoutAttributeWidth multiplier:0.40 constant:0]];
    [buttonBar addConstraint:[NSLayoutConstraint constraintWithItem:nextRoundButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:buttonBar attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    UIButton *mainMenuButton = [[UIButton alloc] init];
    mainMenuButton.backgroundColor = PrimaryButtonBackgroundColor;
    [mainMenuButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal];
    mainMenuButton.translatesAutoresizingMaskIntoConstraints = NO;
    mainMenuButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    mainMenuButton.titleLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [mainMenuButton setTitle:@"Main menu" forState:UIControlStateNormal];
    [buttonBar addSubview:mainMenuButton];
    [buttonBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[b]" options:0 metrics:nil views:@{@"b": mainMenuButton}]];
    [buttonBar addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[b]|" options:0 metrics:nil views:@{@"b": mainMenuButton}]];
    [buttonBar addConstraint:[NSLayoutConstraint constraintWithItem:mainMenuButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:buttonBar attribute:NSLayoutAttributeWidth multiplier:0.40 constant:0]];
    [buttonBar addConstraint:[NSLayoutConstraint constraintWithItem:mainMenuButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:buttonBar attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [mainMenuButton addTarget:self action:@selector(returnToMainMenu) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)returnToMainMenu {
    [self.delegate switchToHomeController];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Prevent horizontal scrolling
    if (sender.contentOffset.x != 0) {
        CGPoint offset = sender.contentOffset;
        offset.x = 0;
        sender.contentOffset = offset;
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
