//
//  HomeViewController.h
//  Tababooboo
//
//  Created by Flora Jin on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectTimeViewControllerDelegate <NSObject>

/**
 Called when a SelectTimeViewControllerDelegate wants to pop a controller
 */
- (void)goBack;

@end

@interface SelectTimeViewController : UIViewController

void goBack();
void startGame();

@property IBOutlet UIButton *backButton;
@property IBOutlet UIButton *startGameButton;
@property int selectedTimeLimit;
@property (weak, nonatomic) id<SelectTimeViewControllerDelegate> delegate;

@end