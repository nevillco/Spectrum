//
//  TSGTouchableView.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGTouchableView.h"

@interface TSGTouchableView ()

@property NSDate* startTime;

@end

@implementation TSGTouchableView

#define kMaxAttempts 3

- (id) init {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.attempts = 0;
    }
    return self;
}

//Track when touch began
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.attempts == kMaxAttempts || touches.count != 1)
        return;
    self.startTime = [NSDate date];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self];
    [self makeGridlinesWithX:point.x withY:point.y];
}

- (void) makeGridlinesWithX: (double)xCoord withY: (double)yCoord
{
    //Removes all existing subviews (old gridlines)
    [[self subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //Vertical gridline
    UIView* vertLineView = [[UIView alloc] initWithFrame:CGRectMake(xCoord, 0, 1.0f, self.frame.size.height)];
    [vertLineView setBackgroundColor:[UIColor blackColor]];
    [self addSubview: vertLineView];
    
    //Horizontal gridline
    UIView* horizLineView = [[UIView alloc] initWithFrame:CGRectMake(0, yCoord, self.frame.size.width, 1.0f)];
    [horizLineView setBackgroundColor:[UIColor blackColor]];
    [self addSubview: horizLineView];
    
    //Force redraw
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.attempts == kMaxAttempts)
        return;
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self];
    
    point = boundPoint(point, [self bounds]);
    [self makeGridlinesWithX:point.x withY:point.y];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
    if(self.attempts == kMaxAttempts)
        return;
    
    // Get the specific point that was touched
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self];
    
    //Ignore multiple simultaneous touches (troll)
    if ([touches count] == 1) {
        NSDate *now = [NSDate date];
        NSTimeInterval deltaT = [now timeIntervalSinceDate:self.startTime];
        
        //Generates color using input values
        UIColor *tryColor  = [self generateColorFromTouchWithX: point.x withY:point.y withTime:(CGFloat)deltaT];
        [self setBackgroundColor: [tryColor colorWithAlphaComponent:0.5f]];
        
        //Add attempt
        self.attempts += 1;
        
        //Occurs only once when last try was just filled
        if(self.attempts == kMaxAttempts)
        {
            
        }
    }
}

static float bound(float pt, float min, float max)
{
    if(pt < min) return min;
    if(pt > max) return max;
    return pt;
}

static CGPoint boundPoint(CGPoint touch, CGRect bounds)
{
    touch.x = bound(touch.x, bounds.origin.x, bounds.origin.x + bounds.size.width);
    touch.y = bound(touch.y, bounds.origin.y, bounds.origin.y + bounds.size.height);
    return touch;
}

- (UIColor*) generateColorFromTouchWithX: (CGFloat)x withY: (CGFloat)y withTime: (CGFloat)time
{
    CGFloat trueX, trueY, trueTime;
    trueX = x / self.frame.size.width; //Adjust range to 1
    trueY = y / self.frame.size.height; //Ditto
    trueTime = MIN(1, time / 4.0); //Ditto, for max time = 4 seconds
    
    return [UIColor colorWithRed: trueY green: trueTime blue: trueX alpha:1];
}

@end
