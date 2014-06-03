//
//  CSProductDetailsViewController.m
//  clojushop_client
//
//  Created by ischuetz on 20/04/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSProductDetailsViewController.h"
#import "CSDataStore.h"
#import "CSDialogUtils.h"
#import "CSCurrencyManager.h"

@interface CSProductDetailsViewController ()

@end

@implementation CSProductDetailsViewController

@synthesize product;
@synthesize productNameLabel, productBrandLabel, productPriceLabel, productImageView, productLongDescrLabel, containerVIew;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = [product name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];

    [productNameLabel setText:[product name]];
    [productBrandLabel setText:[product seller]];
    [productLongDescrLabel setText:[product descr]]; //todo
    
    [productPriceLabel setText:[[CSCurrencyManager sharedCurrencyManager] getFormattedPrice:product.price currencyId:product.currency]];

    NSURL *imageUrl = [NSURL URLWithString:[product imgDetails]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [productImageView setImage:image];
    
//    UIScrollView *scrollView = (UIScrollView *)self.view;
//    scrollView.scrollEnabled = YES;
//    CGSize contentSize = containerVIew.bounds.size;
//    scrollView.contentSize = CGSizeMake(contentSize.width, contentSize.height);
}


- (IBAction)onAddToCartPress:(id)sender {
    
    [[CSDataStore sharedDataStore] addToCart:[product id_] successHandler:^{
        
        [CSDialogUtils showAlert: @"Success" msg: @"Added!"];

    } failureHandler:^{
    }];
    
}
@end
