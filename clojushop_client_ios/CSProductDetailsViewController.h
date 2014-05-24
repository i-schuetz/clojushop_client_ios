//
//  CSProductDetailsViewController.h
//  clojushop_client
//
//  Created by ischuetz on 20/04/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSProduct.h"

@interface CSProductDetailsViewController : UIViewController

@property (nonatomic, strong) CSProduct *product;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productBrandLabel;
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *productLongDescrLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIView *containerVIew;

@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
- (IBAction)onAddToCartPress:(id)sender;

@end
