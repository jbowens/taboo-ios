//
//  WordStore.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Word.h"

//
// Stores dem words and shit.
//
@interface WordStore : NSObject {
    NSMutableArray *words;
    
}


- (void)loadFromFile:(NSString *)filename;

- (int)count;

- (Word *)get:(int)index;

@end
