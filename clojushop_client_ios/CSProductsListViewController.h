//
//  CSProductsListViewController.h
//  clojushop_client
//
//  Created by ischuetz on 16/04/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSBaseViewController.h"

@interface CSProductsListViewController : CSBaseViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end