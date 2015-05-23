//
//  CNLabel.h
//  CNLabelTest
//
//  Created by Connor Neville on 11/28/14.
//  Copyright (c) 2014 connorneville. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNLabel : UILabel

@property NSString* persistentText;
@property int animationDelay;

- (id) initWithText:(NSString*)text;
- (id) initWithCoder:(NSCoder *)aDecoder;

- (void) displayMessage: (NSString*) newText revertAfter:(BOOL) revertAfter withColor: (UIColor*) newColor;
- (void) displayMessage: (NSString*) newText revertAfter:(BOOL) revertAfter;

- (void) setTextToInt: (int)textAsInt;

- (BOOL) isInt;
- (BOOL) incrementTextAndRevertAfter: (BOOL) revertAfter;
- (BOOL) incrementTextAndRevertAfter: (BOOL) revertAfter withBound: (int) bound;
- (BOOL) decrementTextAndRevertAfter: (BOOL) revertAfter;
- (BOOL) decrementTextAndRevertAfter: (BOOL) revertAfter withBound: (int) bound;
- (BOOL) addIntToText: (int) value revertAfter: (BOOL) revertAfter;
- (BOOL) addIntToText: (int) value revertAfter: (BOOL) revertAfter withUpperBound: (int) bound;
- (BOOL) addIntToText: (int) value revertAfter: (BOOL) revertAfter withLowerBound: (int) bound;
- (BOOL) addIntToText: (int) value revertAfter: (BOOL) revertAfter
       withLowerBound: (int) lowerBound andUpperBound: (int) upperBound;

+ (UIColor*) defaultColor;
+ (UIColor*) successColor;
+ (UIColor*) warningColor;
+ (UIColor*) errorColor;

@end
