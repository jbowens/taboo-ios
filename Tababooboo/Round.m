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

- (NSString *) getWordResultWord:(int)index
{
    struct WordResult* wr = (__bridge struct WordResult *)([self.wordList objectAtIndex:index]);
    return wr->word;
}

- (bool) getWordResultCorrect:(int)index
{
    struct WordResult* wr = (__bridge struct WordResult *)([self.wordList objectAtIndex:index]);
    return wr->correct;
}

@end
