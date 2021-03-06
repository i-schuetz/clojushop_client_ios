//
//  CSDataProvider.h
//  clojushop_client_ios
//
//  Created by ischuetz on 28/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDataStore : NSObject

+ (CSDataStore *)sharedDataStore;


- (void)getProducts: (int) start size: (int) size successHandler: (void (^)(NSArray *products)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)login: (NSString *) username password: (NSString *) password successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)register: (NSString *) username email: (NSString *) email password: (NSString *) password successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)removeFromCart: (NSString *) productId successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)addToCart: (NSString *) productId successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)setCartQuantity: (NSString *) productId quantity: (NSString *) quantity successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)getCart: (void (^)(NSArray *items)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)getUser: (void (^)(NSDictionary *user)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)logout: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;
- (void)pay: (NSString *) token value: (NSString *) value currency: (NSString *) currency successHandler: (void (^)(void)) successHandler failureHandler: (void (^)()) failureHandler;

@end
