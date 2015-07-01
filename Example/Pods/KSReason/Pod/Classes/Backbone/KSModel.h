//
//  KSModel.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

#import "KSArchivable.h"
#import "KSParsable.h"
#import "KSIdentifiable.h"
#import "KSEvents.h"

@interface KSModel : NSObject <KSIdentifiable, KSArchivable, KSParsable, KSEvents, NSCopying, NSCoding>

/**
 Get the value of an attribute from a model.
 @param attribute The name of the attribute.
 @return The value of the attribute.
 */
- (id)get:(NSString *)attribute;

/**
 Set the value of an attribute from a model.
 @param attribute The name of the attribute.
 @param value The value of the attribute.
 */
- (void)set:(NSString *)attribute value:(NSString *)value;

/**
 Removes an attribute from a model.
 @param attribute The name of the attribute.
 */
- (void)unset:(NSString *)attribute;

/**
 Returns if the attribute is set to a a value.
 @param attribute The name of the attribute.
 @return A boolean indicating if the attribute exists.
 */
- (BOOL)has:(NSString *)attribute;

/**
 Removes all attributes from the model.
 */
- (void)clear;

/**
 The internal hash containing the state.
 @return The attributes.
 */
- (NSDictionary *)attributes;

@end
