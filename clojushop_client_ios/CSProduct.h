//
//  CSProduct.h
//  Pods
//
//  Created by ischuetz on 16/04/2014.
//
//

#import <Foundation/Foundation.h>

@interface CSProduct : NSObject

+ (CSProduct *) createFromDict:(NSDictionary *)dict;

@property (nonatomic, strong) NSString *id_;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *descr;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *seller;

@end