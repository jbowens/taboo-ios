//
//  RoundResultsViewController.h
//  Tababooboo
//
//  Created by Flora on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Round.h"

@protocol RoundResultsControllerDelegate <NSObject>

@end

@interface RoundResultsViewController : UIViewController <UIScrollViewDelegate>

@property NSString* teamName;
@property Round* currRound;

@property (weak, nonatomic) id<RoundResultsControllerDelegate> delegate;

@end
