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
    [self addOptionButton];
    [self addBackButton];
    [self addStartGameButton];
}

- (void)addOptionButton
{
    // setting up option 1 button
    self.option1Button = [OptionButton buttonWithType:UIButtonTypeRoundedRect];
    self.option1Button.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2-50.0, 100.0, 30.0);
    [self.option1Button setTitle:@"60 seconds" forState:UIControlStateNormal];
    self.option1Button.backgroundColor = PrimaryButtonBackgroundColor;
    [self.option1Button setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal ];
    // TODO: customize components (styling for buttons, etc)
    self.option1Button.optionTimeLimit = 60;
    [self.option1Button addTarget:self action:@selector(setTimeLimit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.option1Button];
    
    // setting up option 2 button
    self.option2Button = [OptionButton buttonWithType:UIButtonTypeRoundedRect];
    self.option2Button.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2, 100.0, 30.0);
    [self.option2Button setTitle:@"90 seconds" forState:UIControlStateNormal];
    self.option2Button.backgroundColor = PrimaryButtonBackgroundColor;
    [self.option2Button setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal ];
    // TODO: customize UI components (styling for buttons, etc)
    self.option2Button.optionTimeLimit = 90;
    [self.option2Button addTarget:self action:@selector(setTimeLimit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.option2Button];
    
    // setting up option 1 button
    self.option3Button = [OptionButton buttonWithType:UIButtonTypeRoundedRect];
    self.option3Button.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2+50.0, 100.0, 30.0);
    [self.option3Button setTitle:@"120 seconds" forState:UIControlStateNormal];
    self.option3Button.backgroundColor = PrimaryButtonBackgroundColor;
    [self.option3Button setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal ];
    // TODO: customize UI components (styling for buttons, etc)
    self.option3Button.optionTimeLimit = 120;
    [self.option3Button addTarget:self action:@selector(setTimeLimit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.option3Button];
    
}

- (void)setTimeLimit:(id)sender
{
    OptionButton *buttonClicked = (OptionButton *)sender;
    self.selectedTimeLimit = buttonClicked.optionTimeLimit;
    self.option1Button.backgroundColor = [UIColor clearColor];
    self.option2Button.backgroundColor = [UIColor clearColor];
    self.option3Button.backgroundColor = [UIColor clearColor];
    buttonClicked.backgroundColor = PrimarySelectedButtonBackgroundColor;
}

- (void)addBackButton
{
    self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.backButton.frame = CGRectMake(10, self.view.frame.size.height-50.0, 100.0, 30.0);
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    self.backButton.backgroundColor = PrimaryButtonBackgroundColor;
    [self.backButton setTitleColor:PrimaryHeaderColor forState:UIControlStateNormal ];
    // TODO: customize UI components (styling for buttons, etc)
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
