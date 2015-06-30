//
//  KSValidator.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <Foundation/Foundation.h>

@interface KSValidator : NSObject

/**
 This helper runs a set of validations against supplied parameters and returns an error or `NULL`.
 @param parameters A set of key and value pairs that the validations will execute against.
 @param validations Should be structured as the key followed by a listing of the desired validations.
 @return An instance of the validator.
 */
+ (instancetype)validator:(NSDictionary *)validations;

/**
 This helper runs the validations.
 @param attributes The attributes to validate.
 */
- (void)validate:(NSDictionary *)attributes;

/**
 An accessor for the errors.
 */
- (NSDictionary *)errors;

/**
 A helper for converting to a string.
 */
- (NSString *)humanize;

/**
 This helper validates the length of a specific string using an exact match.
 @param string A string to validate.
 @param length The desired length.
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)length:(NSString *)string is:(NSUInteger)length;

/**
 This helper validates the length of a specific string using a minimum match.
 @param string A string to validate.
 @param length The desired minimum.
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)length:(NSString *)string minimum:(NSUInteger)minimum;

/**
 This helper validates the length of a specific string using a maximum match.
 @param string A string to validate.
 @param length The desired maximum.
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)length:(NSString *)string maximum:(NSUInteger)maximum;

/**
 This helper validates the string by testing if it matches a given regex.
 @param string A string to validate.
 @param regex A string representation of a regular expression (i.e. '/\A\S+\Z/') or a `NSRegularExpression`.
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)format:(NSString *)string with:(id)regex;

/**
 This helper validates that the string is in a given collection. The collection can be an `NSArray` or `NSSet`.
 @param string An object to validate using the `isEqual:` helper.
 @param collection A `NSArray` or `NSSet` to validate against (or any object that conforms to `KSIterable`).
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)inclusion:(NSObject *)object collection:(NSObject *)collection;

/**
 This helper validates that the string is not in a given collection. The collection can be an `NSArray` or `NSSet`.
 @param string An object to validate using the `isEqual:` helper.
 @param collection A `NSArray` or `NSSet` to validate against (or any object that conforms to `KSIterable`).
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)exclusion:(NSObject *)object collection:(NSObject *)collection;

/**
 This helper validates that the specified object is present. It checks for `NSNull`, NULL, or `ks_present`.
 @param object An object to validate (works best on objects that conform to `KSExists`).
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)presence:(NSObject *)object;

/**
 This helper validates that the specified object is absent. It checks for `NSNull`, NULL, or `ks_blank`.
 @param object An object to validate (works best on objects that conform to `KSExists`).
 @return A boolean indicating if the validator is successful or fails.
 */
+ (BOOL)absence:(NSObject *)object;

@end
