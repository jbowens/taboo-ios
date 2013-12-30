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
#import "RoundResultsViewController.h"
#import "RandomizedWordSequence.h"
#import "Game.h"
#import "Team.h"
#import "WordResult.h"
#import "Constants.h"

@interface MainViewController ()

/// Game instance. Should be used to keep game state information.
@property Game                          *game;

///////////////////////////////////////////////////////
/// Other view controllers
///////////////////////////////////////////////////////

@property HomeViewController            *homeController;
@property SelectTimeViewController      *selectTimeController;
@property GameViewController            *gameController;
@property RoundResultsViewController    *roundResultsController;

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
    // Init the other view controllers
    self.homeController = [[HomeViewController alloc] init];
    self.homeController.delegate = self;
    self.selectTimeController = [[SelectTimeViewController alloc] init];
    self.selectTimeController.delegate = self;
    self.gameController = [[GameViewController alloc] init];
    self.gameController.delegate = self;
    self.roundResultsController = [[RoundResultsViewController alloc] init];
    self.roundResultsController.delegate = self;
    self.game = [[Game alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
    self.view.backgroundColor = PrimaryBackgroundColor;
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
    
    CATransition *animation = [CATransition animation];
    [self pushViewController:self.selectTimeController animated:NO];
    [animation setDuration:0.45];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [[self.selectTimeController.view layer] addAnimation:animation forKey:@"SwitchToView1"];

    // Below code is for a fade transition... thought it was meh
    // but keeping the code just in case
    
/**    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [self pushViewController:self.selectTimeController animated:NO];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }]; */
}

- (void)switchToGameController
{
    self.gameController.secondsPerRound = self.selectTimeController.selectedTimeLimit;
    [self.game createNewTeam:@"Practice Mode"];
    [self.game beginNewRound];
    [self pushViewController:self.gameController animated:YES];
}

- (void)switchToHomeController
{
    [self popToViewController:self.homeController animated:YES];
}


- (void)switchToRoundResultsController
{
    // prints out the correct/skip counts for now just to test
    int numWords = [self.game.currRound.wordList count];
    int numCorrect = 0;
    int numSkip = 0;
    for (int i = 0; i < numWords; ++i) {
        WordResult* wr = [self.game.currRound.wordList objectAtIndex:i];
        if (wr.correct) {
            numCorrect++;
        } else {
            numSkip++;
        }
    }
    NSLog(@"Num correct: %d, num skipped: %d", numCorrect, numSkip);
    // TODO : switch to RoundResultsViewController
    Team* t = [self.game.teams objectAtIndex:self.game.currTeam];
    self.roundResultsController.teamName = t.name;
    self.roundResultsController.currRound = self.game.currRound;
    [self pushViewController:self.roundResultsController animated:NO];
}

- (void)startNextRound
{
    // TODO : switch back to game controller and reset timer
}

- (void)goBack
{
    [self popViewControllerAnimated:YES];
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
