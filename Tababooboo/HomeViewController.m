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
    [self addPlayButton];
}

-(void)addPlayButton
{
    UIButton *playButton = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    playButton.frame = CGRectMake(110.0, 360.0, 100.0, 30.0);
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    playButton.backgroundColor = [UIColor clearColor];
    [playButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal ];
    // TODO: add final UI componenets (styling for buttons, etc)
    // example code for how to add background img for normal and highlighted buttons
    //    UIImage *buttonImageNormal = [UIImage imageNamed:@"blueButton.png"];
    //    UIImage *strechableButtonImageNormal = [buttonImageNormal stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    //    [playButton setBackgroundImage:strechableButtonImageNormal forState:UIControlStateNormal];
    //    UIImage *buttonImagePressed = [UIImage imageNamed:@"whiteButton.png"];
    //    UIImage *strechableButtonImagePressed = [buttonImagePressed stretchableImageWithLeftCapWidth:12 topCapHeight:0];
    //    [playButton setBackgroundImage:strechableButtonImagePressed forState:UIControlStateHighlighted];
    [playButton addTarget:self action:@selector(playAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.playButton];
}

- (void)playAction
{
    // placeholder
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
