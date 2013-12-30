//
//  Constants.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "Constants.h"

UIColor *PrimaryHeaderColor;
UIColor *PrimaryBackgroundColor;
UIColor *PrimaryButtonBackgroundColor;
UIColor *PrimarySelectedButtonBackgroundColor;

UIColor *SecondaryHeaderColor;

UIColor *TimerBackgroundColor;
UIColor *TimerProgressColor;

int InfiniteFontSize = 200;
int TimerFrequencyMilliseconds = 50;
int TimerHeightPixels = 22;

float GuessWordHeightAsPct = 0.20f;


@implementation Constants

+ (void) load {
    PrimaryHeaderColor = [UIColor colorWithRed:129/255.0f green:17/255.0f blue:117/255.0f alpha:1.0f];
    PrimaryBackgroundColor = [UIColor whiteColor];
    PrimaryButtonBackgroundColor = [UIColor clearColor];
    PrimarySelectedButtonBackgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    SecondaryHeaderColor = [UIColor colorWithWhite:0.3 alpha:1.0];
    
    TimerBackgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    TimerProgressColor = [UIColor colorWithRed:226/255.0f green:158/255.0f blue:221/255.0f alpha:1.0f];;
}

@end
