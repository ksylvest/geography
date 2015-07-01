//
//  KSCollection.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

#import "KSArchivable.h"
#import "KSParsable.h"
#import "KSEvents.h"

@class KSModel;

@interface KSCollection : NSObject <KSArchivable, KSParsable, KSEvents, NSCopying, NSCoding, NSFastEnumeration>

/**
 The kind of model the collection should serialize into (defaults to the base). Override this method in subclasses.
 @return A subclass of `KSModel`.
 */
- (Class)kind;

/**
 Accessor for the models parsed by a collection.
 @return An array of `KSModel` objects.
 */
- (NSArray *)models;

/**
 Replace a collection models with the provided models. Override this method in subclasses.
 @param models An array of `KSModel` objects.
 */
- (void)reset:(NSArray *)models;

@end
