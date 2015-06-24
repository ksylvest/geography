//
//  KSValidation.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <Foundation/Foundation.h>


@class KSValidation;

typedef BOOL (^KSValidationBlock)(id attribute);

/**
 A wrapper for a validation (as a kind and parameters pair).
 */
@interface KSValidation : NSObject

/**
 Factory for constructing a validation given an attribute and the desired validations.
 @param kind The kind for the validation (i.e. `KSValidationFormat`, `KSValidationLength`, and more).
 @param options The options for the validation (i.e. `@{ KSValidationFormat: @{ KSValidationWith: @"..." } }`.
 */
+ (instancetype)kind:(NSString *)kind options:(id)options;

/**
 Helper for executing a validation and getting the results (will return a boolean and write to a results array).
 @param object The object to be validated.
 @param callback A callback that can be fired with validations.
 */
- (void)validate:(id)attribute callback:(void (^)(NSString *message))callback;

/**
 Accessor for the constructed options;
 */
- (NSDictionary *)options;

@end

