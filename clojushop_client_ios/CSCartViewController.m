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
#import "CSCartQuantityItem.h"

@interface CSCartViewController ()

@end

@implementation CSCartViewController {
    NSMutableArray *items;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Cart";
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UINib *nib = [UINib nibWithNibName:@"CSCartItemCell" bundle:nil];
    
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"CSCartItemCell"];
    
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
    [[cell quantityField] setText:[item quantity]];

    [cell setController:self];
    [cell setTableView:tableView];
    
    NSURL *imageUrl = [NSURL URLWithString:[item imgList]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [[cell productImg] setImage:image];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 133;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        CSCartItem *item = [items objectAtIndex:[indexPath row]];
        
        [[CSDataProvider sharedDataProvider] removeFromCart:[item id_] successHandler:^{
            [items removeObject:item];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        } failureHandler:^{
        }];
    }
}

- (void)setQuantity:(id)sender atIndexPath:(NSIndexPath *)ip {
    CSCartItem *selectedCartItem = [items objectAtIndex:ip.row];
    [self showDialog: selectedCartItem];
}


- (void)showDialog: (CSCartItem *) selectedCartItem {
    
    //for now dummy quantities, our products don't have stock yet...
    NSArray *quantities = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", nil];
    
    NSArray *cartItemsForQuantitiesDialog = [self wrapQuantityItemsForDialog: quantities];
    CSSingleSelectionController *selectQuantityController = [[CSSingleSelectionController alloc] initWithStyle:UITableViewStylePlain];
    
    selectQuantityController.items = cartItemsForQuantitiesDialog;
    selectQuantityController.delegate = self;
    selectQuantityController.baseObject = selectedCartItem;
    [self presentViewController:selectQuantityController animated:YES completion:nil];
}


- (NSArray *)wrapQuantityItemsForDialog:(NSArray *)quantities {
    NSMutableArray *wrappedQuantityItems = [[NSMutableArray alloc]init];
    
    for (NSString *quantity in quantities) {
        [wrappedQuantityItems addObject:[[CSCartQuantityItem alloc]initWithQuantity:quantity]];
    }
    return wrappedQuantityItems;
}

-(void)selectedItem:(id<CSSingleSelectionItem>)item baseObject:(id)baseObject {
    CSCartItem *cartItem = baseObject;
    NSString *quantity = [item getWrappedItem];
    
    [[CSDataProvider sharedDataProvider] setCartQuantity: cartItem.id_ quantity:quantity successHandler:^{

        cartItem.quantity = quantity; //TODO server should send updated quantity back
        [[self tableView] reloadData];
        
    } failureHandler:^{
    }];
}



@end
