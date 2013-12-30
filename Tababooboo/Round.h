//
//  Round.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/27/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Round : NSObject

struct WordResult
{
    __unsafe_unretained NSString *word;
    bool correct;
};

- (NSString *) getWordResultWord:(int)index;
- (bool) getWordResultCorrect:(int)index;

@property NSMutableArray *wordList;

@end