//
//  NSArray+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <KSReason/KSIterable.h>

typedef BOOL (^KSArrayTestBlock)(id object);

/**
 A category for adding some additional functionaly to arrays.
 */
@interface NSArray (KSEnumerable) <KSIterable>

/**
 Helps to convert a array to a set using a block on element.
 @param block A block used to do the reduction.
 @return A mapped set.
 */
- (NSSet *)KS_set:(KSIterableMapBlock)block;

@end
