//
//  ViewController.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordStore.h"
#import "GameViewController.h"

@interface MainViewController : UINavigationController
@property (readonly)    GameViewController      *gameController;
@end
