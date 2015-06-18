//
//  KSRegion.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import "KSRegion.h"
#import "KSCountry.h"

NSString *NSStringFromKSRegionType(KSRegionType type)
{
    switch (type)
    {
        case KSRegionTypeState: return @"state";
        case KSRegionTypeDistrict: return @"district";
        case KSRegionTypeProvince: return @"province";
        case KSRegionTypeTerritory: return @"territory";
        case KSRegionTypeUnknown: return @"unknown";
    }
}

KSRegionType KSRegionTypeFromNSString(NSString *type)
{
    if ([type isEqualToString:@"state"]) return KSRegionTypeState;
    if ([type isEqualToString:@"district"]) return KSRegionTypeDistrict;
    if ([type isEqualToString:@"province"]) return KSRegionTypeProvince;
    if ([type isEqualToString:@"territory"]) return KSRegionTypeTerritory;
    return KSRegionTypeUnknown;
}

const struct KSRegionAttributes KSRegionAttributes = {
    .type = @"type",
    .name = @"name",
    .code = @"code",
};

const struct KSRegionAssociations KSRegionAssociations = {
    .country = @"country",
};

@implementation KSRegion

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsable

- (void)parse:(NSDictionary *)parameters
{
    self.type = KSRegionTypeFromNSString(parameters[KSRegionAttributes.type]);
    self.name = parameters[KSRegionAttributes.name];
    self.code = parameters[KSRegionAttributes.code];
}

@end
