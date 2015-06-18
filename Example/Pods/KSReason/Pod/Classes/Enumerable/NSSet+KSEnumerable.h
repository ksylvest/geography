//
//  NSSet+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSSetEachBlock)(id object);
typedef void (^KSSetEachIBlock)(id object, NSUInteger index);
typedef id (^KSSetMapBlock)(id object);
typedef id (^KSSetMapIBlock)(id object, NSUInteger index);
typedef id (^KSSetReduceBlock)(id memo, id object);
typedef BOOL (^KSSetTestBlock)(id object);

/**
 A category for adding some additional functionaly to dictionaries.
 */

@interface NSSet (KSEnumerable)

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSSetEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSSetEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 @return A collection where each element has had the block applied to it.
 */
- (NSSet *)KS_map:(KSSetMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 @return A collection where each element has had the block applied to it.
 */
- (NSArray *)KS_mapi:(KSSetMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 @return The value of memo that is returned after each block execution.
 */
- (id)KS_reduce:(KSSetReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSSetTestBlock)block;

/**
 Tests if any element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If any element in the collection passes the block test.
 */
- (BOOL)KS_any:(KSSetTestBlock)block;

/**
 Tests if all element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If all elements in the collection passes the block test.
 */
- (BOOL)KS_all:(KSSetTestBlock)block;

/**
 Count the number of elements in the collection.
 @return The number of elements in the collection.
 */
- (NSUInteger)KS_size;

/**
 Look through each entry in the collection returning all entries that pass the block test.
 @param block A block that is used for filtering.
 @return A filtered collection.
 */
- (NSSet *)KS_filter:(KSSetTestBlock)block;

/**
 Look through each entry in the collection returning all entries that fail the block test.
 @param block A block that is used for filtering.
 @return A rejected collection.
 */
- (NSSet *)KS_reject:(KSSetTestBlock)block;

/**
 Helps to convert a set to an array using a block on each element.
 @param block A block used to do the reduction.
 @return A mapped array.
 */
- (NSArray *)KS_array:(KSSetMapBlock)block;

@end
