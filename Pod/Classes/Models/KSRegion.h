//
//  KSRegion.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

@class KSCountry;

@interface KSRegion : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, strong) KSCountry *country;

@end
