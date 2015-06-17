//
//  KSCountry.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

@class KSRegions;

@interface KSCountry : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) KSRegions *regions;

@end
