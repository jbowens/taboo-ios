//
//  LayoutObservableView.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/28/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "FontEqualizingView.h"
#include <float.h>

@implementation FontEqualizingView {
    NSMutableSet *viewsToUpdate;
}

- (id)init
{
    self = [super init];
    if (self) {
        viewsToUpdate = [[NSMutableSet alloc] init];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        viewsToUpdate = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];

    // Now that everything has been layed out, update the fonts to be
    // the min of the fonts of the views that we're equalizing fonts
    // across.
    float minimumFontSize = FLT_MAX;
    for (UIView *view in self->viewsToUpdate) {
        minimumFontSize = MIN(minimumFontSize, [[view valueForKey:@"font"] pointSize]);
    }
    
    NSLog(@"Calculated minimum font size of %f\n", minimumFontSize);
    
    // Set all the fonts to be this font size now
    for (UIView *view in self->viewsToUpdate) {
        UIFont *font = [view valueForKey:@"font"];
        font = [font fontWithSize:minimumFontSize];
        [view setValue:font forKey:@"font"];
    }
}

- (void) addEqualFontsView:(UIView *)view
{
    [self->viewsToUpdate addObject:view];
}

@end
