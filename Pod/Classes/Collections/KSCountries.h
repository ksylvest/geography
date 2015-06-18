//
//  KSCountries.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSCollection.h>

@class KSCountry;

/**
 A collection of countries.
 */
@interface KSCountries : KSCollection

/**
 Factory for accessing a collection with all regions.
 @return A collection with all regions.
 */
+ (instancetype)all;

/**
 Find a country by name.
 @param name The name of the country.
 @return The country or NULL if not found.
 */
- (KSCountry *)named:(NSString *)name;

/**
 Find a country by code.
 @param code The code of the country.
 @return The country or NULL if not found.
 */
- (KSCountry *)coded:(NSString *)name;

@end
