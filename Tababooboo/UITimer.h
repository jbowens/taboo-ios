//
//  UITimer.h
//  Tababooboo
//
//  Created by Jackson Owens on 12/29/13.
//  Copyright (c) 2013 Tababooboo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITimer : UIView

// Data properties
@property (nonatomic) int time;
@property (nonatomic) int maxTime;

// Presentational properties
@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) UIColor *foregroundColor;

@end
