//
//  ViewController.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "MainViewController.h"
#import "RandomizedWordSequence.h"

@interface MainViewController ()

/// Store of all known taboo words
@property WordStore                 *wordStore;

/// Current sequence. This should be used for retrieving the
/// next words to display.
@property RandomizedWordSequence    *currentSequence;

@end

@implementation MainViewController

- (id)init
{
    if (!(self = [super init])) {
        return nil;
    }
    
    self.wordStore = [[WordStore alloc] init];
    
    // Initializes the word store by reading words in from the json file
    // included with the app.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"json"];
    [self.wordStore loadFromFile:filePath];
    
    self.currentSequence = [[RandomizedWordSequence alloc] initWithWordStore:self.wordStore];
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
