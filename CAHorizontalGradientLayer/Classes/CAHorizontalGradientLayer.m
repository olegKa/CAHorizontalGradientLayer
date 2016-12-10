//
//  CAHorizontalGradientLayer.m
//  NesuEdu
//
//  Created by OLEG KALININ on 23.08.16.
//  Copyright © 2016 Moleculus. All rights reserved.
//

#import "CAHorizontalGradientLayer.h"

@implementation CAHorizontalGradientLayer

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.masksToBounds = YES;
        [self setNeedsDisplay];
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    size_t gradLocationsNum     = 2;
    CGFloat gradLocations[2]    = {1.0f, 0.0f};
    CGFloat gradColors[8]       = {0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.0f,0.2f};
    CGColorSpaceRef colorSpace  = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient      = CGGradientCreateWithColorComponents(colorSpace, gradColors, gradLocations, gradLocationsNum);
    CGColorSpaceRelease(colorSpace);
    
    CGPoint gradStartPoint  = CGPointMake(0, 0);
    CGPoint gradEndPoint    = CGPointMake(self.bounds.size.width, self.bounds.size.height);
    
    CGContextDrawLinearGradient(ctx, gradient, gradStartPoint, gradEndPoint, kCGGradientDrawsBeforeStartLocation);
    
    CGGradientRelease(gradient);
}


@end
