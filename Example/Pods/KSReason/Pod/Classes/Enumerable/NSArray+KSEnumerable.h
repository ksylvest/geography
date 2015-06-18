//
//  NSArray+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSArrayEachBlock)(id object);
typedef void (^KSArrayEachIBlock)(id object, NSUInteger index);
typedef id (^KSArrayMapBlock)(id object);
typedef id (^KSArrayMapIBlock)(id object, NSUInteger index);
typedef id (^KSArrayReduceBlock)(id memo, id object);
typedef BOOL (^KSArrayTestBlock)(id object);

/**
 A category for adding some additional functionaly to arrays.
 */
@interface NSArray (KSEnumerable)

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSArrayEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSArrayEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 @return A collection where each element has had the block applied to it.
 */
- (NSArray *)KS_map:(KSArrayMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 @return A collection where each element has had the block applied to it.
 */
- (NSArray *)KS_mapi:(KSArrayMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 @return The value of memo that is returned after each block execution.
 */
- (id)KS_reduce:(KSArrayReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 @return The found element or NULL.
 */
- (id)KS_find:(KSArrayTestBlock)block;

/**
 Tests if any element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If any element in the collection passes the block test.
 */
- (BOOL)KS_any:(KSArrayTestBlock)block;

/**
 Tests if all element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If all elements in the collection passes the block test.
 */
- (BOOL)KS_all:(KSArrayTestBlock)block;

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
- (NSArray *)KS_filter:(KSArrayTestBlock)block;

/**
 Look through each entry in the collection returning all entries that fail the block test.
 @param block A block that is used for filtering.
 @return A rejected collection.
 */
- (NSArray *)KS_reject:(KSArrayTestBlock)block;

/**
 Helps to convert a array to a set using a block on element.
 @param block A block used to do the reduction.
 @return A mapped set.
 */
- (NSSet *)KS_set:(KSArrayMapBlock)block;

@end
