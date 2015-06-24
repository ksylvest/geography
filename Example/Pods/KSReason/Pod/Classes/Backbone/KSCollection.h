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

@class KSModel;

@interface KSCollection : NSObject <KSArchivable, KSParsable, NSFastEnumeration>

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

@end
