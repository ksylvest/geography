//
//  NSArray+KSInflection.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-12.
//
//

#import <Foundation/Foundation.h>

/**
 A category for doing pluralization, singularization, classification, and parameterization.
 */
@interface NSString (KSInflections)

/**
 Converts a singular string to a plural string (i.e. "rainbow" to "rainbows")
 @return A pluralized representation of the string.
 */
- (NSString *)ks_pluralize;

/**
 Converts a plural string to a singular string (i.e. "rainbow" to "rainbows")
 @return A singularized representation of the string.
 */
- (NSString *)ks_singularize;

/**
 Converts a string to a parameter representation
 @return A string to be converted.
 */
- (NSString *)ks_parameterize;

@end
