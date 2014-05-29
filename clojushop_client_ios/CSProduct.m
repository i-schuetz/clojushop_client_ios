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
@synthesize imgList;
@synthesize imgDetails;
@synthesize price;
@synthesize currency;

NSString *const JSON_KEY_ID = @"id";
NSString *const JSON_KEY_NAME = @"na";
NSString *const JSON_KEY_IMAGE = @"img";
NSString *const JSON_KEY_DESCRIPTION = @"des";
NSString *const JSON_KEY_PRICE = @"pr";
NSString *const JSON_KEY_PRICE_VALUE = @"v";
NSString *const JSON_KEY_PRICE_CURRENCY = @"c";
NSString *const JSON_KEY_SELLER = @"se";
NSString *const JSON_KEY_LIST = @"pl";
NSString *const JSON_KEY_DETAILS = @"pd";

//TODO use constructors instead

+ (CSProduct *) createFromDict:(NSDictionary *)dict {
    CSProduct *p = [CSProduct alloc];
    
    @try {
        [p setId_:[dict objectForKey:JSON_KEY_ID]];
        [p setName:[dict objectForKey:JSON_KEY_NAME]];
        [p setDescr:[dict objectForKey:JSON_KEY_DESCRIPTION]];
        
        NSDictionary *price = [dict objectForKey:JSON_KEY_PRICE];
        [p setPrice:[price objectForKey:JSON_KEY_PRICE_VALUE]];
        [p setCurrency: [price objectForKey:JSON_KEY_PRICE_CURRENCY]];
        
        [p setSeller:[dict objectForKey:JSON_KEY_SELLER]];
        
        NSDictionary *imgs = [dict objectForKey:JSON_KEY_IMAGE];
        [p setImgList:[imgs objectForKey:JSON_KEY_LIST]];
        [p setImgDetails:[imgs objectForKey:JSON_KEY_DETAILS]];
        
        return p;
        
    } @catch (NSException *exception) {
        NSLog(@"Exception: %@", exception);
        return nil;
    }
}

+ (CSProduct *) createFromCD: (CSProductCD *)productCD {
    CSProduct *p = [CSProduct alloc];
    
    [p setId_:productCD.id];
    [p setName:productCD.name];
    [p setDescr:productCD.descr];
    [p setPrice:productCD.price];
    [p setCurrency:productCD.currency];
    
    [p setSeller:productCD.seller];
    
    [p setImgList:productCD.img_pl];
    [p setImgDetails:productCD.img_pd];
    
    return p;
}



+ (NSArray *) createFromDictArray:(NSArray *)dictArray {
    NSMutableArray *productsArray = [[NSMutableArray alloc] init];
    for (NSDictionary * dict in dictArray) {
        [productsArray addObject: [self createFromDict:dict]];
    }
    return productsArray;
}

+ (NSArray *) createFromCDs: (NSArray *)productCDs {
    NSMutableArray *products = [[NSMutableArray alloc]init];
    for (CSProductCD *productCD in productCDs) {
        [products addObject:[self createFromCD:productCD]];
    }
    return products;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"id_: %@, name: %@, description: %@, seller: %@, img list: %@, img details: %@, price: %@, currency: %@",
            id_, name, descr, seller, imgList, imgDetails, price, currency];
}

@end
