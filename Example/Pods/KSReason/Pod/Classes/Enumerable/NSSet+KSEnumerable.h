//
//  NSSet+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <KSReason/KSIterable.h>

/**
 A category for adding some additional functionaly to dictionaries.
 */

@interface NSSet (KSEnumerable) <KSIterable>

/**
 Helps to convert a set to an array using a block on each element.
 @param block A block used to do the reduction.
 @return A mapped array.
 */
- (NSArray *)ks_array:(KSIterableMapBlock)block;

@end
