//
//  Constants.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <Foundation/Foundation.h>

extern UIColor      *PrimaryHeaderColor;
extern UIColor      *PrimaryBackgroundColor;
extern UIColor      *PrimaryButtonBackgroundColor;
extern UIColor      *PrimarySelectedButtonBackgroundColor;

extern UIColor      *SecondaryHeaderColor;

extern UIColor      *TimerBackgroundColor;
extern UIColor      *TimerProgressColor;

extern UIFont       *ProhibitedWordsFont;
extern UIColor      *ProhibitedWordsColor;

extern UIFont       *GuessWordFont;

extern UIColor      *CorrectWordColor;
extern UIColor      *SkippedWordColor;

extern NSString     *WordSequenceFilename;

extern int      InfiniteFontSize;

extern int      TimerFrequencyMilliseconds;
extern int      TimerHeightPixels;

extern float    GuessWordHeightAsPct;
extern float    ProhibitedWordsHeightAsPct;
extern int      MinimumSpacingBetweenProhibitedWordsPixels;
extern float    ButtonsHeightAsPct;
extern int      MinimumButtonContainerTopMargin;

extern float    TeamNameHeightAsPct;
extern float    ResultWordsHeightAsPct;

extern int      ProhibitedWordCount;

@interface Constants : NSObject
@end
