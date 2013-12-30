//
//  Round.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "Round.h"

@implementation Round

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.wordList = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

@end
