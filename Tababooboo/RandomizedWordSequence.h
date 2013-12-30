//
//  RandomizedWordSequence.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"
#import "WordStore.h"

@interface RandomizedWordSequence : NSObject

- (id) initWithWordStore:(WordStore *)store;

- (bool) hasNext;

- (Word *) next;

- (void) restart;

@end
