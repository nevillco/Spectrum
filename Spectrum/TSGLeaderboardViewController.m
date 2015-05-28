//
//  TSGLeaderboardViewController.m
//  Spectrum
//
//  Created by Connor Neville on 5/27/15.
//  Copyright (c) 2015 connorneville. All rights reserved.
//

#import "TSGLeaderboardViewController.h"
#import "TSGLeaderboardView.h"
#import "TSGLeaderboardCell.h"
#import "TSGParseReader.h"

@interface TSGLeaderboardViewController ()

@end

@implementation TSGLeaderboardViewController

- (void) loadView {
    TSGLeaderboardView* view = [[TSGLeaderboardView alloc] init];
    self.view = view;
}

- (id) init {
    self = [super init];
    if(self) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            self.leaderboardEntries = [TSGParseReader leaderboardEntries];
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self addActions];
                [self configureTable];
                TSGLeaderboardView* view = (TSGLeaderboardView*) self.view;
                UITableView* table = view.leaderboardTable;
                [table reloadData];
            });
        });
    }
    return self;
}

- (void) addActions {
    TSGLeaderboardView* view = (TSGLeaderboardView*) self.view;
    [view.goBackButton addTarget:self action:@selector(goBackButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) goBackButtonPressed: (id) sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (void) configureTable {
    TSGLeaderboardView* view = (TSGLeaderboardView*) self.view;
    UITableView* table = view.leaderboardTable;
    table.allowsSelection = NO;
    [table registerClass:[TSGLeaderboardCell class] forCellReuseIdentifier:@"LeaderboardCell"];
    [table setDataSource: self];
    [table setDelegate: self];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [TSGParseReader maximumLeaderboardEntries];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* reuseIdentifier = @"LeaderboardCell";
    TSGLeaderboardCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    if(!cell) {
        cell = [[TSGLeaderboardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    [cell setStyleForRowIndex: (int)indexPath.row];
    if(self.leaderboardEntries.count <= indexPath.row) {
        [cell makeEmpty];
    }
    else {
        [cell updateWithEntry: (PFObject*)(self.leaderboardEntries[indexPath.row])];
    }
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

@end
