//
//  UITimer.m
//  Tababooboo
//
//  Created by Jackson Owens on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import "UITimer.h"
#include <UIKit/UIKit.h>

@implementation UITimer

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        self.time = 0;
        self.maxTime = 60;
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        self.foregroundColor = [UIColor blackColor];
    }
    return self;
}

- (void) setTime:(int)time
{
    self->_time = time;
    [self setNeedsDisplay];
}

- (void) setMaxTime:(int)maxTime
{
    self->_maxTime = maxTime;
    [self setNeedsDisplay];
}

- (void) setBackgroundColor:(UIColor *)backgroundColor
{
    self->_backgroundColor = backgroundColor;
    [self setNeedsDisplay];
}

- (void) setForegroundColor:(UIColor *)foregroundColor
{
    self->_foregroundColor = foregroundColor;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    float pct = (float) self.time / (float) self.maxTime;
    float elapsedWidth = rect.size.width * pct;
    
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Draw the background color across the entire area.
    CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
    CGContextAddRect(ctx, rect);
    CGContextFillPath(ctx);
    
    // Draw the elapsed portion
    CGContextSetFillColorWithColor(ctx, self.foregroundColor.CGColor);
    CGRect elapsedRect = CGRectMake(rect.origin.x, rect.origin.y, elapsedWidth, rect.size.height);
    CGContextAddRect(ctx, elapsedRect);
    CGContextFillPath(ctx);
}


@end
