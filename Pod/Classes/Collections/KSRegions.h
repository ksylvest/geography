//
//  KSRegions.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSCollection.h>

@class KSRegion;

/**
 A collection of regions.
 */
@interface KSRegions : KSCollection

/**
 Factory for accessing a collection with all regions.
 @return A collection with all regions.
 */
+ (instancetype)all;

/**
 Find a region by code.
 @param code The code of the region.
 @return The region or NULL if not found.
 */
- (KSRegion *)named:(NSString *)name;

/**
 Find a region by code.
 @param code The code of the country.
 @return The region or NULL if not found.
 */
- (KSRegion *)coded:(NSString *)name;

@end
