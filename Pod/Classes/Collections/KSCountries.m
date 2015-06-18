//
//  KSCountries.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSCountries.h"
#import "KSCountry.h"

@implementation KSCountries

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (Class)kind
{
    return [KSCountry class];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Accessors

+ (instancetype)all
{
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *file = [bundle pathForResource:@"KSGeography.bundle/KSGeography" ofType:@"plist"];
    NSArray *geography = [[NSArray alloc] initWithContentsOfFile:file];

    NSArray *parameters = geography;
    
    KSCountries *collection = [self new];
    [collection parse:parameters];
    
    return collection;
}

- (KSCountry *)named:(NSString *)name
{
    return [self.models KS_find:^BOOL(KSCountry *country) {
        return [country.name isEqualToString:name];
    }];
}

- (KSCountry *)coded:(NSString *)code
{
    return [self.models KS_find:^BOOL(KSCountry *country) {
        return [country.code isEqualToString:code];
    }];
}

@end
