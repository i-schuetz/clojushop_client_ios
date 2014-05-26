//
//  CSCartViewController.m
//  clojushop_client
//
//  Created by ischuetz on 23/04/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSCartViewController.h"
#import "CSDataProvider.h"
#import "CSCartItem.h"
#import "CSCartItemCell.h"

@interface CSCartViewController ()

@end

@implementation CSCartViewController {
    NSArray *items;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void) onRetrievedItems: (NSArray *) i {
    items = i;
    
    if ([items count] == 0) {
        [[self emptyCartView] setHidden:NO];
        
        //TODO why this didnt work with only nib - before there was view with children table and empty, empty never shows
        [[[self tableView] superview] addSubview:[self emptyCartView]];

    } else {
        [[self emptyCartView] setHidden:YES];
        [[self tableView] reloadData];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *nib = [UINib nibWithNibName:@"CSCartItemCell" bundle:nil];
    
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"CSCartItemCell"];
}

- (void)viewDidAppear:(BOOL)animated {
    [self requestItems];
    
    
}

- (void) requestItems {
    [self setProgressHidden: NO];
    
    [[CSDataProvider sharedDataProvider] getCart:^(NSArray *items) {
        [self setProgressHidden: YES];
        
        [self onRetrievedItems: items];
        
    } failureHandler:^{
        [self setProgressHidden: YES];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CSCartItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSCartItemCell"];
    
    CSCartItem *item = [items objectAtIndex:[indexPath row]];
    
    [[cell productName] setText:[item name]];
    [[cell productDescr] setText:[item descr]];
    [[cell productBrand] setText:[item seller]];
    [[cell productPrice] setText:[item price]];
    
    NSURL *imageUrl = [NSURL URLWithString:[item imgList]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [[cell productImg] setImage:image];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 133;
}


@end
