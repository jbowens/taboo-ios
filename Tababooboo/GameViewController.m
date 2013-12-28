//
//  GameViewController.m
//  Tababooboo
//
//  Created by Flora on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "GameViewController.h"
#import "Constants.h"

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
    self.timerLabel = [[UILabel alloc] init];
    self.timerLabel.frame = CGRectMake(self.view.frame.size.width/2 - 25, 75, 50, 20);
    [self.timerLabel setBackgroundColor:[UIColor clearColor]];
    [self.timerLabel setTextColor:PrimaryHeaderColor];
    int initMinutes = (self.secondsLeft%3600)/60;
    int initSeconds = (self.secondsLeft%3600)%60;
    self.timerLabel.text =[NSString stringWithFormat:@"%02d:%02d", initMinutes, initSeconds];
    [self.view addSubview:self.timerLabel];
    [self addTimer];
}

- (void)updateTimer:(NSTimer *)timer
{
    if (self.secondsLeft > 0) {
        self.secondsLeft -- ;
        int minutes = (self.secondsLeft%3600)/60;
        int seconds = (self.secondsLeft%3600)%60;
        self.timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }
    else {
        NSLog(@"Timer reached 0 seconds.");
        [timer invalidate];
        timer = nil;
    }
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
