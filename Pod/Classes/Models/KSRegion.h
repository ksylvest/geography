//
//  KSRegion.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSModel.h>
#import <KSReason/KSAttribute.h>
#import <KSReason/KSAssociation.h>

typedef NS_ENUM(NSInteger, KSRegionType) {
    KSRegionTypeUnknown,
    KSRegionTypeProvince,
    KSRegionTypeState,
    KSRegionTypeTerritory,
    KSRegionTypeDistrict,
};

extern const struct KSRegionAttributes {
    KSAttribute NSString *type;
    KSAttribute NSString *name;
    KSAttribute NSString *code;
} KSRegionAttributes;

extern const struct KSRegionAssociations {
    KSAttribute NSString *country;
} KSRegionAssociations;

@class KSCountry;

/**
 A model for a region with a name and code.
 */
@interface KSRegion : KSModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, assign) KSRegionType type;

@property (nonatomic, strong) KSCountry *country;

@end
