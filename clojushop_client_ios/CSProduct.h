//
//  CSProduct.h
//  Pods
//
//  Created by ischuetz on 16/04/2014.
//
//

#import <Foundation/Foundation.h>
#import "CSProductCD.h"

@interface CSProduct : NSObject

+ (CSProduct *) createFromDict:(NSDictionary *)dict;
+ (CSProduct *) createFromCD: (CSProductCD *)productCD;
+ (NSArray *) createFromCDs: (NSArray *)productCDs;
+ (NSArray *) createFromDictArray:(NSArray *)dictArray;

@property (nonatomic, strong) NSString *id_;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *descr;
@property (nonatomic, strong) NSString *imgList;
@property (nonatomic, strong) NSString *imgDetails;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString * currency;
@property (nonatomic, strong) NSString *seller;



@end