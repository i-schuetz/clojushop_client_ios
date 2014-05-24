//
//  CSProductDetailsViewController.m
//  clojushop_client
//
//  Created by ischuetz on 20/04/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSProductDetailsViewController.h"
#import "CSDataProvider.h"

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [[self navigationController] setNavigationBarHidden:NO animated:NO];

    [productNameLabel setText:[product name]];
    [productBrandLabel setText:[product seller]];
    [productLongDescrLabel setText:[product descr]]; //todo
    [productPriceLabel setText:[product price]];
    NSURL *imageUrl = [NSURL URLWithString:[product picture]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    [productImageView setImage:image];
    
    UIScrollView *scrollView = (UIScrollView *)self.view;
    
    
    scrollView.scrollEnabled = YES;
    
    CGSize contentSize = containerVIew.bounds.size;
    scrollView.contentSize = CGSizeMake(contentSize.width, contentSize.height);
}


- (IBAction)onAddToCartPress:(id)sender {
    
    [[CSDataProvider sharedDataProvider] addToCart:[product id_] successHandler:^{
        
    } failureHandler:^{
    }];
    
}
@end
