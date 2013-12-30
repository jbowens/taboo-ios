//
//  ViewController.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SelectTimeViewController.h"
#import "GameViewController.h"
#import "RandomizedWordSequence.h"
#import "Game.h"

@interface MainViewController ()

/// Store of all known taboo words
@property WordStore                 *wordStore;

/// Current sequence. This should be used for retrieving the
/// next words to display.
@property RandomizedWordSequence    *currentSequence;

/// Game instance. Should be used to keep game state information.
@property Game *game;

///////////////////////////////////////////////////////
/// Other view controllers
///////////////////////////////////////////////////////

@property HomeViewController        *homeController;
@property SelectTimeViewController  *selectTimeController;
@property GameViewController        *gameController;

@end

@implementation MainViewController

- (id)init
{
    if (!(self = [super init])) {
        return nil;
    }
    return self;
}

- (void)setup
{
    self.wordStore = [[WordStore alloc] init];
    
    // Initializes the word store by reading words in from the json file
    // included with the app.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"json"];
    [self.wordStore loadFromFile:filePath];
    
    self.currentSequence = [[RandomizedWordSequence alloc] initWithWordStore:self.wordStore];
    
    // Init the other view controllers
    self.homeController = [[HomeViewController alloc] init];
    self.homeController.delegate = self;
    self.selectTimeController = [[SelectTimeViewController alloc] init];
    self.selectTimeController.delegate = self;
    self.gameController = [[GameViewController alloc] init];
    self.gameController.delegate = self;
    self.game = [[Game alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
    
    // Hide the navigation bar at the top.
    self.navigationBarHidden = YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    // Quick! go to the home controller!
    [self pushViewController:self.homeController animated:NO];
}

- (void)switchToSelectTimeController
{
    [self pushViewController:self.selectTimeController animated:NO];
}

- (void)switchToGameController
{
    self.gameController.secondsPerRound = self.selectTimeController.selectedTimeLimit;
    [self.game createNewTeam:@"Practice Mode"];
    [self.game beginNewRound];
    [self pushViewController:self.gameController animated:NO];
}

- (void)switchToRoundResultsController
{
    // prints out the correct/skip counts for now just to test
    int numWords = [self.game.currRound.wordList count];
    int numCorrect = 0;
    int numSkip = 0;
    for (int i = 0; i < numWords; ++i) {
        if ([self.game.currRound getWordResultCorrect:i]) {
            numCorrect++;
        } else {
            numSkip++;
        }
    }
    NSLog(@"Num correct: %d, num skipped: %d", numCorrect, numSkip);
    // TODO : switch to RoundResultsViewController
}

- (void)goBack
{
    [self popToRootViewControllerAnimated:NO];
}

- (Game *)getGame
{
    return self.game;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
