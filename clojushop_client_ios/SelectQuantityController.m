//
//  SelectQuantityController.m
//  clojushop_client_ios
//
//  Created by ischuetz on 27/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "SelectQuantityController.h"

@interface SelectQuantityController ()

@end

@implementation SelectQuantityController

@synthesize quantities;

-(id)initWithStyle:(UITableViewStyle)style
{
    if ([super initWithStyle:style] != nil) {
        
        //Initialize the array
        quantities = [NSMutableArray array];
        
        //Set up the array of colors.
        [quantities addObject:@"1"];
        [quantities addObject:@"2"];
        [quantities addObject:@"3"];
        [quantities addObject:@"4"];
        [quantities addObject:@"5"];
        [quantities addObject:@"6"];
        [quantities addObject:@"7"];
        [quantities addObject:@"8"];
        [quantities addObject:@"9"];
    }
    
    return self;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [quantities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [quantities objectAtIndex:indexPath.row];
    
    return cell;
}

@end
