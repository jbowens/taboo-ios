//
//  GameViewController.m
//  Tababooboo
//
//  Created by Flora on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "GameViewController.h"
#import "Constants.h"
#import "Game.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.hidesBackButton = YES;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = PrimaryBackgroundColor;
    [self addTimer];
    [self setupWordLabels];
    [self setupButtons];
}

- (void)updateTimer:(NSTimer *)timer
{
    if (1000 * self.secondsPerRound - self.millisecondsElapsed > 0) {
        self.millisecondsElapsed += TimerFrequencyMilliseconds;
        self.uiTimer.time = self.millisecondsElapsed;
    }
    else {
        NSLog(@"Timer reached 0 seconds.");
        [timer invalidate];
        timer = nil;
    }
}

- (void)addTimer
{
    self.uiTimer = [[UITimer alloc] init];
    self.uiTimer.maxTime = self.secondsPerRound * 1000;
    self.uiTimer.backgroundColor = TimerBackgroundColor;
    self.uiTimer.foregroundColor = TimerProgressColor;
    self.uiTimer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.uiTimer];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.uiTimer
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:0
                                                           constant:TimerHeightPixels]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[timer]" options:0 metrics:nil views: @{@"timer": self.uiTimer}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[timer]|" options:0 metrics:nil views: @{@"timer": self.uiTimer}]];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: TimerFrequencyMilliseconds/1000.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)setupWordLabels
{
    // Construct the primary word label for the guess word.
    self.wordLabel = [[UILabel alloc] init];
    self.wordLabel.text = @"Dummy text";
    self.wordLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.wordLabel.textAlignment = NSTextAlignmentCenter;
    self.wordLabel.adjustsFontSizeToFitWidth = YES;
    self.wordLabel.font = [UIFont systemFontOfSize:InfiniteFontSize];
    self.wordLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    [self.view addSubview:self.wordLabel];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[w]-|" options:0 metrics:nil views:@{@"w": self.wordLabel}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.uiTimer
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:0.05
                                                           constant:10]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.wordLabel
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:GuessWordHeightAsPct
                                                           constant:0]];
    // Setup the container for the prohibited words. All labels will be relative to this.
    UIView *prohibitedContainer = [[UIView alloc] init];
    prohibitedContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:prohibitedContainer];
    
    NSDictionary *vD = @{@"pc": prohibitedContainer};
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:prohibitedContainer
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:ProhibitedWordsHeightAsPct
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:prohibitedContainer
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.wordLabel
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:10]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[pc]-|" options:0 metrics:nil views:vD]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:prohibitedContainer
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationLessThanOrEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0]];
    
    // Create the prohibited word labels
    NSMutableArray *prohibitedWordLabels = [[NSMutableArray alloc] initWithCapacity:ProhibitedWordCount];
    
    UILabel *firstLabel = nil;
    UILabel *prevLabel = nil;
    for (int i = 0; i < ProhibitedWordCount; ++i) {
        UILabel *label = [[UILabel alloc] init];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label.adjustsFontSizeToFitWidth = YES;
        label.font = ProhibitedWordsFont;
        label.textColor = ProhibitedWordsColor;
        label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"Dummy text";
        [prohibitedContainer addSubview:label];
        [prohibitedContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[w]-|" options:0 metrics:nil views:@{@"w": label}]];
        
        if (!prevLabel) {
            firstLabel = label;
            // This is the first label. We need to make a constraint against
            // the top of its container.
            [prohibitedContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[w]" options:0 metrics:nil views:@{@"w": label}]];
        } else {
            // There was a label before us. We need to add constraints to
            // position this label in relation to that label.
            [prohibitedContainer addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                                            attribute:NSLayoutAttributeTop
                                                                            relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                               toItem:prevLabel
                                                                            attribute:NSLayoutAttributeBottom
                                                                           multiplier:1.0
                                                                             constant:0]];
            // This label must also be the same height as the previous label.
            [prohibitedContainer addConstraint:[NSLayoutConstraint constraintWithItem:label
                                                                            attribute:NSLayoutAttributeHeight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:firstLabel
                                                                            attribute:NSLayoutAttributeHeight
                                                                           multiplier:1.0
                                                                             constant:0]];
            // We'd also like the vertical trailing space to be equal to the height.
        }
        
        prohibitedWordLabels[i] = label;
        prevLabel = label;
    }
    
    // For the last label, we want it to be flush against the bottom of the container
    [prohibitedContainer addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[w]|" options: 0 metrics:nil views:@{@"w": prevLabel}]];
    self.prohibitedWordContainer = prohibitedContainer;
    self.prohibitedWordLabels = prohibitedWordLabels;
}

- (void)setupButtons
{
    // Setup the UI view that contains the buttons.
    UIView *buttonContainer = [[UIView alloc] init];
    buttonContainer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    buttonContainer.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:buttonContainer];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[buttons]|" options:0 metrics:nil views:@{@"buttons": buttonContainer}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttons]|" options:0 metrics:nil views:@{@"buttons": buttonContainer}]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:buttonContainer
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:ButtonsHeightAsPct
                                                           constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.prohibitedWordContainer
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationLessThanOrEqual
                                                             toItem:buttonContainer
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant: -1 * MinimumButtonContainerTopMargin]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
