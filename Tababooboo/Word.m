//
//  Word.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "Word.h"

@interface Word ()
@property int id;
@property NSString *word;
@property NSSet *prohibitedWords;
@end

@implementation Word

- (id)initWithId:(int)identifier word:(NSString *)word prohibitedWords:(NSSet *)prohibitedWords {
    if (self = [super init]) {
        if (!word || !prohibitedWords) {
            return nil;
        }
        self.id = identifier;
        self.word = word;
        self.prohibitedWords = prohibitedWords;
        return self;
    } else {
        return nil;
    }
}

- (id)initFromDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        if (!dict)
            return nil;
        NSLog(@"dict = %@\n", dict);
        self.id = [[dict objectForKey:@"id"] intValue];
        self.word = [dict objectForKey:@"word"];
        self.prohibitedWords = [dict objectForKey:@"prohibited"];
        return self;
    } else {
        return nil;
    }
}

@end
