//
//  RandomizedWordSequence.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#include <stdlib.h>

#import "RandomizedWordSequence.h"
#import "WordStore.h"

@implementation RandomizedWordSequence {
    WordStore *backingWordStore;
    NSArray *randomizedIndices;
    int nextIndex;
}

NSInteger shuffleCmp(id a, id b, void* c)
{
    return (arc4random() & 1) ? NSOrderedAscending : NSOrderedDescending;
}

- (id) initWithWordStore:(WordStore *)store {
    if (self = [super init]) {
        if (!store) {
            return nil;
        }
        
        self->backingWordStore = store;
        
        // Generate an array containing numbers [0, ..., n-1]
        int wordCount = [store count];
        NSMutableArray *indices = [NSMutableArray arrayWithCapacity:wordCount];
        for (int i = 0; i < wordCount; i++)
            indices[i] = [NSNumber numberWithInt:i];
        
        // Shuffle the array by sorting with a randomized comparator.
        self->randomizedIndices = [indices sortedArrayUsingFunction:shuffleCmp context:0];
        
        self->nextIndex = 0;
        
        return self;
    } else {
        return nil;
    }
}

- (id) initFromDictionary:(NSDictionary *)dictionary wordStore:(WordStore *)wordStore
{
    if (self = [super init]) {
        if (!wordStore || !dictionary || ![dictionary count]) {
            return nil;
        }
        self->backingWordStore = wordStore;
        self->randomizedIndices = [dictionary objectForKey:@"indices"];
        self->nextIndex = [[dictionary objectForKey:@"nextIndex"] intValue];
        return self;
    } else {
        return nil;
    }
}

- (bool) hasNext {
    return self->nextIndex < [self->randomizedIndices count];
}

- (Word *) next {
    if (self->nextIndex >= [self->randomizedIndices count])
        return nil;
    
    int wordStoreIndex = [self->randomizedIndices[self->nextIndex++] integerValue];
    
    return [self->backingWordStore get:wordStoreIndex];
}

- (void) restart {
    self->randomizedIndices = [self->randomizedIndices sortedArrayUsingFunction:shuffleCmp context:0];
    self->nextIndex = 0;
}

// Utility method that saves the state of the sequence to a dictionary. This
// is used as a utility method when converting the sequence to a plist for
// permanent storage.
- (NSDictionary *) toDict {
    return @{
             @"nextIndex": [NSNumber numberWithInt:self->nextIndex],
               @"indices": self->randomizedIndices
            };
}

@end
