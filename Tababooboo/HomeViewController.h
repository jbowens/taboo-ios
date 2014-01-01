//
//  HomeViewController.h
//  Tababooboo
//
//  Created by Flora Jin on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeViewControllerDelegate <NSObject>

/**
 Called when a HomeViewControllerDelegate wants to switch to a SelectTimeViewController
 */
- (void)switchToModeSelectController;

@end

@interface HomeViewController : UIViewController

void playAction();
void rulesAction();

@property IBOutlet UIButton *playButton;
@property IBOutlet UIButton *rulesButton;
@property (weak, nonatomic) id<HomeViewControllerDelegate> delegate;

@end
