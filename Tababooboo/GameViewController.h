//
//  GameViewController.h
//  Tababooboo
//
//  Created by Flora on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameViewControllerDelegate <NSObject>

@end

@interface GameViewController : UIViewController


void addTimer();
void updateTimer();

@property IBOutlet UIButton *correctButton;
@property IBOutlet UIButton *skipButton;
@property IBOutlet NSTimer *timer;
@property IBOutlet UILabel *timerLabel;
@property int secondsLeft;
@property (weak, nonatomic) id<GameViewControllerDelegate> delegate;

@end