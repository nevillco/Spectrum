//
//  CNLabel.m
//
//  Extension of UILabel that automatically finds
//  the correct height to word wrap is contents, allows animation on
//  any text changes and allows for temporary
//  messages while storing a persistent string to revert to.
//
//  Created by Connor Neville on 11/28/14.
//  Copyright (c) 2014 connorneville. All rights reserved.
//

#import "CNLabel.h"

@implementation CNLabel

static const int DEFAULT_ANIM_DELAY = 3;

//Constructors
//Custom constructor specifying default text
- (id)initWithText:(NSString*)text
{
    self = [super init];
    if (self) {
        self.text = text;
        self.persistentText = text;
        [self setLineBreakMode: NSLineBreakByWordWrapping];
        [self adjustFrameToText];
        [self setAnimationDelay: DEFAULT_ANIM_DELAY];
    }
    return self;
}

//initWithCoder is called on UILabels created in IB
- (id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        self.persistentText = self.text;
        [self setLineBreakMode: NSLineBreakByWordWrapping];
        [self adjustFrameToText];
        [self setAnimationDelay: DEFAULT_ANIM_DELAY];
    }
    return self;
}

//Methods

//Gets correct height after allowing wrapping. User can
//change to other wrap options (ie. [myLabel
//setLineBreakMode: NSLineBreakByCharWrapping]
//then manually call this method
- (void) adjustFrameToText
{
    [self setNumberOfLines: 0];
    [self sizeToFit];
}

//Display a (temporary or permanent) message with a new color
- (void) displayMessage: (NSString*) newText revertAfter:(BOOL) revertAfter withColor: (UIColor*) newColor
{
    //Pre-animation setup
    self.alpha = 0;
    //Label content/color change
    [self setText: newText];
    //Set persistent text if not a temporary message
    if(!revertAfter)
        [self setPersistentText: newText];
    //Will be passed by userInfo to resetText
    UIColor* previousColor = self.textColor;
    [self setTextColor: newColor];
    //Label animation
    [UIView animateWithDuration:0.5 delay:0 options: UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.alpha = 1;}
                     completion:nil];
    if(revertAfter)
        [NSTimer scheduledTimerWithTimeInterval: self.animationDelay target:self
            selector:@selector(resetText:) userInfo:previousColor repeats:NO];
}

//Display a (temporary or permanent) message without a new color
- (void) displayMessage: (NSString*) newText revertAfter:(BOOL) revertAfter
{
    //Pre-animation setup
    self.alpha = 0;
    //Label content/color change
    [self setText: newText];
    //Set persistent text if not a temporary message
    if(!revertAfter)
        [self setPersistentText: newText];
    //Label animation
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.alpha = 1;}
                     completion:nil];
    if(revertAfter)
        [NSTimer scheduledTimerWithTimeInterval: self.animationDelay target:self
            selector:@selector(resetText:) userInfo:nil repeats:NO];
}

//Wrapper function to quickly set label
//to an int value
- (void)setTextToInt: (int)textAsInt {
    [super setText:[NSString stringWithFormat:@"%d", textAsInt]];
}

//Reset text called after a temporary message is displayed
//in order to redisplay the persistent text (not public)
- (void) resetText: (NSTimer*) timer
{
    //Pre-animation setup
    self.alpha = 0;
    //Label content/color change
    self.text = self.persistentText;
    if([timer userInfo])
        [self setTextColor: [timer userInfo]];
    //Label animation
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.alpha = 1;}
                     completion:nil];
}

//Returns whether the currently displayed text is an integer
- (BOOL) isInt {
    if ([self.text isEqualToString:@"0"])
        return YES;
    return (self.text.intValue != 0);
}

//Increments the integer value of the current text
//Returns FALSE and takes no action if string is not
//an integer
- (BOOL) incrementTextAndRevertAfter: (BOOL) revertAfter {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    intVal++;
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Increments the integer value of the current text
//Returns FALSE and takes no action if string is not
//an integer or if the value would exceed the given boundary
- (BOOL) incrementTextAndRevertAfter: (BOOL) revertAfter
                           withBound: (int) bound {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    if(intVal == bound)
        return FALSE;
    intVal++;
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Decrements the integer value of the current text
//Returns FALSE and takes no action if string is not
//an integer
- (BOOL) decrementTextAndRevertAfter: (BOOL) revertAfter {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    intVal--;
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Increments the integer value of the current text
//Returns FALSE and takes no action if string is not
//an integer or if the value would exceed the given boundary
- (BOOL) decrementTextAndRevertAfter: (BOOL) revertAfter
                           withBound: (int) bound {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    if(intVal == bound)
        return FALSE;
    intVal--;
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Add any value to the current text
//Returns FALSE and takes no action if the string is not
//an integer
//Can use negative numbers to subtract
- (BOOL) addIntToText: (int) value
          revertAfter: (BOOL) revertAfter {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    intVal = intVal + value;
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Add any value to the current text
//Returns FALSE and takes no action if the string is not
//an integer or if the string is at the bound
//Will stop at bound
//Can use negative numbers to subtract
- (BOOL) addIntToText: (int) value
          revertAfter: (BOOL) revertAfter
       withUpperBound: (int) bound {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    if(intVal == bound)
        return FALSE;
    intVal = MIN(intVal + value, bound);
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Add any value to the current text
//Returns FALSE and takes no action if the string is not
//an integer or if the string is already at the bound
//Will stop at bound
//Can use negative numbers to subtract
- (BOOL) addIntToText: (int) value
          revertAfter: (BOOL) revertAfter
       withLowerBound: (int) bound {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    if(intVal == bound)
        return FALSE;
    intVal = MAX(intVal + value, bound);
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

//Add any value to the current text
//Returns FALSE and takes no action if the string is not
//an integer or if the string is already at either bound (and will exceed)
//Will stop at bound
//Can use negative numbers to subtract
- (BOOL) addIntToText: (int) value
          revertAfter: (BOOL) revertAfter
       withLowerBound: (int) lowerBound
        andUpperBound: (int) upperBound {
    if(![self isInt])
        return FALSE;
    int intVal = [self.text intValue];
    if((intVal == lowerBound && value <= 0) ||
       (intVal == upperBound && value >= 0))
        return FALSE;
    intVal = MIN(MAX(intVal + value, lowerBound), upperBound);
    [self displayMessage:[NSString stringWithFormat:@"%d", intVal] revertAfter:revertAfter];
    return TRUE;
}

+ (UIColor*) defaultColor
{
    static UIColor* defaultColor = nil;
    if(!defaultColor)
        defaultColor = [UIColor blackColor];
    return defaultColor;
}

+ (UIColor*) successColor
{
    static UIColor* successColor = nil;
    if(!successColor)
        successColor = [UIColor greenColor];
    return successColor;
}

+ (UIColor*) warningColor
{
    static UIColor* warningColor = nil;
    if(!warningColor)
        warningColor = [UIColor orangeColor];
    return warningColor;
}

+ (UIColor*) errorColor
{
    static UIColor* errorColor = nil;
    if(!errorColor)
        errorColor = [UIColor redColor];
    return errorColor;
}

@end
