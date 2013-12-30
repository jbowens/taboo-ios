//
//  Game.h
//  Tababooboo
//
//  Created by Flora on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Round.h"
#import "Word.h"

@interface Game : NSObject

- (void) createNewTeam:(NSString *)name;
- (void) beginNewRound;
- (void) updateRound:(Word *)word :(bool)correct;

@property int currTeam;
@property NSMutableArray *teams;
@property Round *currRound;

@end