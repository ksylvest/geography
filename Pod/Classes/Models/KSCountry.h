//
//  KSCountry.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSModel.h>
#import <KSReason/KSAttribute.h>
#import <KSReason/KSAssociation.h>

extern const struct KSCountryAttributes {
    KSAttribute NSString *name;
    KSAttribute NSString *code;
} KSCountryAttributes;

extern const struct KSCountryAssociations {
    KSAttribute NSString *regions;
} KSCountryAssociations;

@class KSRegions;

/**
 A model for a country with a name and code.
 */
@interface KSCountry : KSModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) KSRegions *regions;

@end
