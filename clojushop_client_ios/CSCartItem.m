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
@synthesize imgList;
@synthesize imgDetails;
@synthesize price;
@synthesize quantity;


NSString *const JSON_KEY_CART_ITEM_ID = @"id";
NSString *const JSON_KEY_CART_ITEM_NAME = @"na";
NSString *const JSON_KEY_CART_IMAGE = @"pic"; //TODO use img
NSString *const JSON_KEY_CART_ITEM_DESCRIPTION = @"des";
NSString *const JSON_KEY_CART_ITEM_PRICE = @"pr";
NSString *const JSON_KEY_CART_ITEM_SELLER = @"se";
NSString *const JSON_KEY_CART_ITEM_QUANTITY = @"qt";
NSString *const JSON_KEY_CART_LIST = @"pl";
NSString *const JSON_KEY_CART_DETAILS = @"pd";

+ (CSCartItem *) createFromDict:(NSDictionary *)dict {
    
    CSCartItem *item = [CSCartItem alloc];
    
    @try {
        [item setId_:[dict objectForKey:JSON_KEY_CART_ITEM_ID]];
        [item setName:[dict objectForKey:JSON_KEY_CART_ITEM_NAME]];
        [item setDescr:[dict objectForKey:JSON_KEY_CART_ITEM_DESCRIPTION]];
        [item setPrice:[dict objectForKey:JSON_KEY_CART_ITEM_PRICE]];
        [item setSeller:[dict objectForKey:JSON_KEY_CART_ITEM_SELLER]];
        [item setQuantity:[NSString stringWithFormat:@"%@", [dict objectForKey:JSON_KEY_CART_ITEM_QUANTITY]]];
        
        NSDictionary *imgs = [dict objectForKey:JSON_KEY_CART_IMAGE];
        [item setImgList:[imgs objectForKey:JSON_KEY_CART_LIST]];
        [item setImgDetails:[imgs objectForKey:JSON_KEY_CART_DETAILS]];
        
        return item;
        
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        return nil;
    }
}


- (NSString *)description {
    return [NSString stringWithFormat:@"id_: %@, name: %@, description: %@, seller: %@, img list: %@, img details: %@, price: %@, quantity: %@",
            id_, name, descr, seller, imgList, imgDetails, price, quantity];
}

@end
