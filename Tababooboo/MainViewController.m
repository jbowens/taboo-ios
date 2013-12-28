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

@interface MainViewController ()

/// Store of all known taboo words
@property WordStore                 *wordStore;

/// Current sequence. This should be used for retrieving the
/// next words to display.
@property RandomizedWordSequence    *currentSequence;


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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setup];
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
    self.gameController.secondsLeft = self.selectTimeController.selectedTimeLimit;
    [self pushViewController:self.gameController animated:NO];
}

- (void)goBack
{
    [self popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
