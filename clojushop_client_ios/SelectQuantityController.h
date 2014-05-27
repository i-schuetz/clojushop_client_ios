//
//  SelectQuantityController.h
//  clojushop_client_ios
//
//  Created by ischuetz on 27/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectQuantityControllerDelegate <NSObject>

@required
- (void)selectedQuantity:(NSString *)quantity;
@end

@interface SelectQuantityController : UITableViewController

@property (nonatomic, strong) NSMutableArray *quantities;
@property (nonatomic, weak) id<SelectQuantityControllerDelegate> delegate;

@end