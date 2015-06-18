//
//  KSInflector.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-12.
//
//

#import <Foundation/Foundation.h>

@interface KSInflector : NSObject

/**
 A shared inflector used for string inflections.
 */
+ (instancetype)shared;

/**
 A configuration block that used the shared inflector.
 @param callback A block that will be called with the inflector for configuration.
 */
+ (void)config:(void (^)(KSInflector *inflector))callback;

/**
 Define a rule that works for both pluralization and singularization (used in both directions).
 @param rule A string.
 @param replacement A string.
 */
- (void)irregular:(NSString *)rule replacement:(NSString *)replacement;

/**
 Define a pluralization rule and the replacement.
 @param rule The rule as a string.
 @param replacement the replacement string.
 */
- (void)plural:(NSString *)rule replacement:(NSString *)replacement;

/**
 Define a singularization rule and the replacement.
 @param rule The rule as a string.
 @param replacement the replacement string.
 */
- (void)singular:(NSString *)rule replacement:(NSString *)replacement;

/**
 Convert a string from plural to singular.
 @param string The string to be converted.
 @return A converted string.
 */
- (NSString *)pluralize:(NSString *)string;

/**
 Convert a string from singular to plural.
 @param string The string to be converted.
 @return A converted string.
 */
- (NSString *)singularize:(NSString *)string;

@end
