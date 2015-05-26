//
//  TSGTouchableView.m
//  Spectrum
//
//  Created by Connor Neville on 5/23/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGTouchableView.h"
#import "TSGHomeView.h"
#import "AppDelegate.h"

@interface TSGTouchableView ()

@property NSDate* startTime;

@end

@implementation TSGTouchableView

- (id) init {
    self = [super init];
    if(self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1.0f;
        self.attempts = 0;
        self.createdColor = [UIColor clearColor];
        
        //Notify label does not need to be added yet,
        //because gridlines will remove it anyway
        self.notifyLabel = [[CNLabel alloc] initWithText:@"You've used all of your attempts for this color. Press Submit to see how you did!"];
        self.notifyLabel.textColor = [UIColor clearColor];
        self.notifyLabel.font = [UIFont fontWithName:[AppDelegate fontName] size:12.0f];
        self.notifyLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.notifyLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void) makeNotifyLabelConstraints {
    [self addConstraints: @[[NSLayoutConstraint constraintWithItem:self.notifyLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeadingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.notifyLabel
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTrailingMargin
                                                        multiplier:1.0f
                                                          constant:0.0f],
                            [NSLayoutConstraint constraintWithItem:self.notifyLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0f
                                                          constant:0.0f]
                            ]];
}

#pragma mark touch listeners

//Track when touch began
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.attempts == [AppDelegate maxAttemptsPerColor] || touches.count != 1) {
        [self notifyMaxAttempts];
        return;
    }
    self.startTime = [NSDate date];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self];
    [self makeGridlinesWithX:point.x withY:point.y];
    
    [self setRedValue: point.y / self.frame.size.height];
    [self setBlueValue: point.x / self.frame.size.width];
    [self setGreenValue: 0.0f];
    
    //Progress bars
    self.progressTimer = [NSTimer scheduledTimerWithTimeInterval: 0.02
                                                                target:self
                                                              selector:@selector(updateProgressBarsDuringTouch:)
                                                              userInfo:nil
                                                               repeats:YES];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.attempts == [AppDelegate maxAttemptsPerColor])
        return;
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [TSGTouchableView boundPointForTouch:[touch locationInView: self] withBounds:self.bounds];
    
    [self setRedValue: point.y / self.frame.size.height];
    [self setBlueValue: point.x / self.frame.size.width];
    
    [self makeGridlinesWithX:point.x withY:point.y];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
    if(self.attempts == [AppDelegate maxAttemptsPerColor]) {
        [self notifyMaxAttempts];
        return;
    }
    
    // Get the specific point that was touched
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView: self];
    
    //Ignore multiple simultaneous touches (troll)
    if ([touches count] == 1) {
        [self updateGreenValue];
        [self setRedValue: point.y / self.frame.size.height];
        [self setBlueValue: point.x / self.frame.size.width];
        
        //Stop the timer
        [self.progressTimer invalidate];
        
        //Generates color using input values
        UIColor *tryColor  = [self generateColor];
        [self setBackgroundColor: [tryColor colorWithAlphaComponent:0.4f]];
        [self setCreatedColor: tryColor];
        [self alertSuperviewToNewColor];
        
        //Add attempt
        self.attempts += 1;
        
        //Occurs only once when last try was just filled
        if(self.attempts == [AppDelegate maxAttemptsPerColor])
        {
            [self notifyMaxAttempts];
        }
    }
}

- (void) updateGreenValue {
    NSDate *now = [NSDate date];
    NSTimeInterval deltaT = [now timeIntervalSinceDate:self.startTime];
    float deltaAdjusted = (MAX(0, deltaT - 1.0) / 4.0);
    [self setGreenValue: deltaAdjusted];
}

- (void) updateProgressBarsDuringTouch: (NSTimer*) timer {
    [self updateGreenValue];
    [self.redProgress setProgress: self.redValue];
    [self.blueProgress setProgress: self.blueValue];
    [self.greenProgress setProgress: self.greenValue];
}

#pragma mark gridline methods

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

#pragma mark boundary class methods

+ (float) boundFloat: (float) val withMin: (float) min withMax: (float) max
{
    if(val < min) return min;
    if(val > max) return max;
    return val;
}

+ (CGPoint) boundPointForTouch: (CGPoint) touch withBounds: (CGRect) bounds
{
    touch.x = [TSGTouchableView boundFloat:touch.x withMin:bounds.origin.x
                                   withMax:bounds.origin.x + bounds.size.width];
    touch.y = [TSGTouchableView boundFloat:touch.y withMin:bounds.origin.y
                                   withMax:bounds.origin.y + bounds.size.height];
    return touch;
}

#pragma mark output

- (UIColor*) generateColor
{
    return [UIColor colorWithRed: self.redValue green: self.greenValue blue: self.blueValue alpha:1];
}

- (void) notifyMaxAttempts {
    //Removes all existing subviews (old gridlines)
    [[self subviews]
     makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self addSubview: self.notifyLabel];
    [self makeNotifyLabelConstraints];
    [self.notifyLabel displayMessage:self.notifyLabel.text revertAfter:NO withColor:[UIColor blackColor]];
}

- (void) alertSuperviewToNewColor {
    TSGHomeView* homeView = (TSGHomeView*) self.superview;
    [homeView.submitButton setEnabled: true];
    [homeView setGuessColor: self.createdColor];
}

@end
