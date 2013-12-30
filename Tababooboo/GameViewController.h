//
//  GameViewController.h
//  Tababooboo
//
//  Created by Flora on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITimer.h"
#import "Game.h"

@protocol GameViewControllerDelegate <NSObject>

- (Game *)getGame;
- (void)switchToRoundResultsController;

@end

@interface GameViewController : UIViewController


void addTimer();
void updateTimer();

@property UILabel      *wordLabel;

@property UIView       *prohibitedWordContainer;
@property NSArray      *prohibitedWordLabels;

@property NSTimer      *timer;
@property UITimer      *uiTimer;

@property int           secondsPerRound;
@property int           millisecondsElapsed;
@property (weak, nonatomic) id<GameViewControllerDelegate> delegate;

@end