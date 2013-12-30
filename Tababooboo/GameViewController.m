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
    [self addCorrectButton];
    [self addSkipButton];
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
}

- (void)addCorrectButton
{
    // TODO: Fill
}

- (void)addSkipButton
{
    // TODO: Fill
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
