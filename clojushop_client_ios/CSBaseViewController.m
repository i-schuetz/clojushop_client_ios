//
//  CSBaseViewController.m
//  clojushop_client
//
//  Created by ischuetz on 24/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSBaseViewController.h"
#import "CSProgressIndicator.h"

@interface CSBaseViewController ()

@end

@implementation CSBaseViewController {
    CSProgressIndicator *indicator;
}

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
	// Do any additional setup after loading the view.
    
    [self initProgressIndicator];
}

- (void)viewDidAppear:(BOOL)animated {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initProgressIndicator {
    indicator = [[CSProgressIndicator alloc] initWithFrame: [self getProgressBarBounds]];
    [self.view addSubview:indicator];

    [self setProgressHidden:YES];
    
}

- (void)setProgressHidden: (BOOL)hidden {
    [indicator setHidden: hidden];
}

- (CGRect)getProgressBarBounds {
    CGRect bounds = [[UIScreen mainScreen] bounds];
    
    CGSize viewSize =  self.tabBarController.view.frame.size;
    CGSize tabBarSize = self.tabBarController.tabBar.frame.size;
    
    bounds.size.height = viewSize.height - tabBarSize.height;
    
    return bounds;
}

@end
