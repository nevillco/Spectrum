//
//  TSGInstructionViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/25/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGInstructionViewController.h"
#import "TSGInstructionView.h"
#import <MessageUI/MessageUI.h>

@interface TSGInstructionViewController ()

@end

@implementation TSGInstructionViewController

- (void) loadView {
    TSGInstructionView* view = [[TSGInstructionView alloc] init];
    self.view = view;
}

- (id) init {
    self = [super init];
    if(self) {
        [self addActions];
    }
    return self;
}

- (void) addActions {
    TSGInstructionView* view = (TSGInstructionView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [view.emailButton addTarget:self action:@selector(emailButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void) emailButtonPressed: (id) sender {
    if([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        mailCont.mailComposeDelegate = self;
        
        [mailCont setSubject:@"The Spectrum Game"];
        [mailCont setToRecipients:[NSArray arrayWithObject:@"nevillco@bc.edu"]];
        [mailCont setMessageBody:@"Let me know what you think!" isHTML:NO];
        
        [self presentViewController:mailCont animated:TRUE completion:nil];
    }
    
    
}

//MailComposer delegate method
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
