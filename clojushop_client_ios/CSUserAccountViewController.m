//
//  CSUserAccountViewController.m
//  clojushop_client
//
//  Created by ischuetz on 23/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSUserAccountViewController.h"
#import "CSDataProvider.h"
#import "CSLoginRegisterViewController.h"

@interface CSUserAccountViewController ()

@end

@implementation CSUserAccountViewController

@synthesize nameField;
@synthesize emailField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"User account"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [[CSDataProvider sharedDataProvider] getUser:^(NSDictionary *user) {
        
        [nameField setText:[user objectForKey:@"una"]];
        [emailField setText:[user objectForKey:@"uem"]];
        
    } failureHandler:^{
        NSLog(@"Couldnt get user");
    }];
    

}


- (void) returnToPreviousTab {
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    int activeTab = [(NSNumber*)[def objectForKey:@"prevActiveTab"] intValue];
    
    NSLog(@"getting the tab index: %d", activeTab);
    
    [self.tabBarController setSelectedIndex:activeTab];
}

- (void) logout {
    
    [self setProgressHidden: NO];

    [[CSDataProvider sharedDataProvider] logout:^() {
        
        [self setProgressHidden: YES];

        [self replaceWithLoginRegisterTab];
         
//        [self returnToPreviousTab];
        
    } failureHandler:^{
    }];
    
}


- (void) replaceWithLoginRegisterTab {
    
    UIViewController* loginRegisterViewController = [[CSLoginRegisterViewController alloc] init];
    UINavigationController *loginRegisterNavController = [[UINavigationController alloc] initWithRootViewController:loginRegisterViewController];
    [loginRegisterNavController.tabBarItem setTitle:@"Login / Register"];
    
    int tabIndex = 2;
    NSMutableArray *tabbarViewControllers = [self.tabBarController.viewControllers mutableCopy];
    [tabbarViewControllers replaceObjectAtIndex: tabIndex withObject:loginRegisterNavController];
    self.tabBarController.viewControllers = tabbarViewControllers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogoutPress:(id)sender {
    [self logout];
}
@end
