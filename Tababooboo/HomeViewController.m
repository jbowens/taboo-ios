//
//  HomeViewController.m
//  Tababooboo
//
//  Created by Flora on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    self.view.backgroundColor = [UIColor colorWithRed:129/255.0f green:17/255.0f blue:117/255.0f alpha:1.0f];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self addPlayButton];
    [self addRulesButton];
}

-(void)addPlayButton
{
    self.playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.playButton.frame = CGRectMake(self.view.frame.size.width/2 - 50.0, self.view.frame.size.height/2, 100.0, 30.0);
    [self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    self.playButton.backgroundColor = [UIColor clearColor];
    [self.playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    // TODO: add final UI components (styling for buttons, etc)
    // example code for how to add background img for normal and highlighted buttons
    //    UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];
    //    UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    //    [playButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    //    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];
    //    UIImage *strechableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    //    [playButton setBackgroundImage:strechableButtonImagePressed forState:UIControlStateHighlighted];
    [self.playButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
}

- (void)playAction
{
    [self.delegate switchToSelectTimeController];
}

- (void)addRulesButton
{
    self.rulesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.rulesButton.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2+50.0, 100.0, 30.0);
    [self.rulesButton setTitle:@"How to Play" forState:UIControlStateNormal];
    self.rulesButton.backgroundColor = [UIColor clearColor];
    [self.rulesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    // TODO: add final UI components (styling for buttons, etc)
    [self.rulesButton addTarget:self action:@selector(rulesAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rulesButton];
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
