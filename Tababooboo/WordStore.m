//
//  WordStore.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "WordStore.h"

@implementation WordStore

// Initializes the word store by reading words in from the json file
// included with the app.
- (id) init {
    if (!(self = [super init])) {
        return nil;
    }
    
    self->words = [[NSMutableArray alloc] init];
    
    return self;
}

@end
