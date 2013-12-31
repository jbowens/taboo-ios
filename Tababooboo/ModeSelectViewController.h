//
//  ModeSelectViewController.h
//  Tababooboo
//
//  Created by Flora on 12/30/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModeSelectViewControllerDelegate <NSObject>

/**
 Called when a SelectTimeViewControllerDelegate wants to pop a controller
 */
- (void)goBack;
- (void)switchToGameController;

@end

@interface ModeSelectViewController : UIViewController

void goBack();
void startGame();

@property IBOutlet UIButton *backButton;
@property IBOutlet UIButton *nextButton;
@property bool teamMode;
@property (weak, nonatomic) id<ModeSelectViewControllerDelegate> delegate;

@end