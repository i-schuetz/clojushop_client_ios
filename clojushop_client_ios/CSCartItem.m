//
//  CSCartItem.m
//  clojushop_client
//
//  Created by ischuetz on 22/05/2014.
//  Copyright (c) 2014 ivanschuetz. All rights reserved.
//

#import "CSCartItem.h"

@implementation CSCartItem

@synthesize id_;
@synthesize name;
@synthesize descr;
@synthesize seller;
@synthesize picture;
@synthesize price;
@synthesize quantity;


NSString *const JSON_KEY_CART_ITEM_ID = @"id";
NSString *const JSON_KEY_CART_ITEM_NAME = @"na";
NSString *const JSON_KEY_CART_ITEM_PICTURE = @"pic";
NSString *const JSON_KEY_CART_ITEM_DESCRIPTION = @"des";
NSString *const JSON_KEY_CART_ITEM_PRICE = @"pr";
NSString *const JSON_KEY_CART_ITEM_SELLER = @"se";
NSString *const JSON_KEY_CART_ITEM_QUANTITY = @"se";

+ (CSCartItem *) createFromDict:(NSDictionary *)dict {
    
    CSCartItem *item = [CSCartItem alloc];
    
    @try {
        [item setId_:[dict objectForKey:JSON_KEY_CART_ITEM_ID]];
        [item setName:[dict objectForKey:JSON_KEY_CART_ITEM_NAME]];
        [item setPicture:[dict objectForKey:JSON_KEY_CART_ITEM_PICTURE]];
        [item setDescr:[dict objectForKey:JSON_KEY_CART_ITEM_DESCRIPTION]];
        [item setPrice:[dict objectForKey:JSON_KEY_CART_ITEM_PRICE]];
        [item setSeller:[dict objectForKey:JSON_KEY_CART_ITEM_SELLER]];
        [item setQuantity:[dict objectForKey:JSON_KEY_CART_ITEM_QUANTITY]];
        
        return item;
        
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        return nil;
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"id_: %@, name: %@, description: %@, seller: %@, picture: %@, price: %@, quantity: %@",
            id_, name, descr, seller, picture, price, quantity];
}

@end
