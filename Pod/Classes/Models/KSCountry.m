//
//  KSCountry.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import "KSCountry.h"
#import "KSRegions.h"
#import "KSRegion.h"

const struct KSCountryAttributes KSCountryAttributes = {
    .name = @"name",
    .code = @"code",
};

const struct KSCountryAssociations KSCountryAssociations = {
    .regions = @"regions",
};

@implementation KSCountry

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecyce

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.regions = [KSRegions new];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsable

- (void)parse:(NSDictionary *)parameters
{
    self.name = parameters[KSCountryAttributes.name];
    self.code = parameters[KSCountryAttributes.code];
    
    [self.regions parse:parameters[KSCountryAssociations.regions]];
    
    for (KSRegion *region in self.regions.models)
        region.country = self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Description

- (NSString *)description
{
    return [NSString stringWithFormat:@"<KSCountry name=%@ code=%@>",
            self.name, self.code];
}

@end
