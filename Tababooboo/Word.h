//
//  Word.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/24/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject


@property (readonly) int id;

@property (readonly) NSString *word;

@property (readonly) NSSet *prohibitedWords;

- (id)initWithId:(int)identifier word:(NSString *)word prohibitedWords:(NSSet *)prohibitedWords;
- (id)initFromDictionary:(NSDictionary *)dict;
- (NSString *)formattedWord;

@end
