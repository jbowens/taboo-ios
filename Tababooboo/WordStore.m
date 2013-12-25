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
    
    // Parse words.json as json
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *e = nil;
    NSArray *wordsFromFile = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &e];
    
    if (!wordsFromFile) {
        NSLog(@"Error parsing words.json on word store initialization");
        return nil;
    }
    
    for (NSDictionary *item in wordsFromFile) {
        NSLog(@"Item: %@", item);
    }
    
    // Add all the parsed words to the store
    [self->words addObjectsFromArray:wordsFromFile];
    
    return self;
}

@end
