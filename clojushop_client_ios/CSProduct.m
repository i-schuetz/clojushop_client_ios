//
//  CSProduct.m
//  Pods
//
//  Created by ischuetz on 16/04/2014.
//
//

#import "CSProduct.h"

@implementation CSProduct

@synthesize id_;
@synthesize name;
@synthesize descr;
@synthesize seller;
@synthesize picture;
@synthesize price;


NSString *const JSON_KEY_ID = @"id";
NSString *const JSON_KEY_NAME = @"na";
NSString *const JSON_KEY_PICTURE = @"img";
NSString *const JSON_KEY_DESCRIPTION = @"des";
NSString *const JSON_KEY_PRICE = @"pr";
NSString *const JSON_KEY_SELLER = @"se";



+ (CSProduct *) createFromDict:(NSDictionary *)dict {
    
    CSProduct *p = [CSProduct alloc];
    
    @try {
        [p setId_:[dict objectForKey:JSON_KEY_ID]];
        [p setName:[dict objectForKey:JSON_KEY_NAME]];
        [p setPicture:[dict objectForKey:JSON_KEY_PICTURE]];
        [p setDescr:[dict objectForKey:JSON_KEY_DESCRIPTION]];
        [p setPrice:[dict objectForKey:JSON_KEY_PRICE]];
        [p setSeller:[dict objectForKey:JSON_KEY_SELLER]];
        return p;
        
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        return nil;
    }
}
- (NSString *)description {
    return [NSString stringWithFormat:@"id_: %@, name: %@, description: %@, seller: %@, picture: %@, price: %@",
            id_, name, descr, seller, picture, price];
}

@end
