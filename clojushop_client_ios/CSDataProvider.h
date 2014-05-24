//
//  CSDataProvider.h
//  clojushop_client
//
//  Created by ischuetz on 22/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDataProvider : NSObject

+ (CSDataProvider *)sharedDataProvider;

- (void)getProducts: (int) start size: (int) size successHandler: (void (^)(NSArray *products)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)login: (NSString *) username password: (NSString *) password successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)register: (NSString *) username email: (NSString *) email password: (NSString *) password successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)addToCart: (NSString *) productId successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)getCart: (void (^)(NSArray *items)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)getUser: (void (^)(NSDictionary *user)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)logout: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;


@end