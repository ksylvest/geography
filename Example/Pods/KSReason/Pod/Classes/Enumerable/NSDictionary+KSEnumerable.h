//
//  NSDictionary+KSEnumerable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import <Foundation/Foundation.h>

typedef void (^KSDictionaryEachBlock)(id key, id value);
typedef void (^KSDictionaryEachIBlock)(id key, id value, NSUInteger index);
typedef id (^KSDictionaryMapBlock)(id key, id value);
typedef id (^KSDictionaryMapIBlock)(id key, id value, NSUInteger index);
typedef id (^KSDictionaryReduceBlock)(id memo, id key, id value);
typedef BOOL (^KSDictionaryTestBlock)(id key, id value);

extern KSDictionaryTestBlock KSDictionaryTestBlockNegate(KSDictionaryTestBlock block);

/**
 A category for adding some additional functionaly to dictionaries.
 */
@interface NSDictionary (KSEnumerable)

/**
 Iterate over each element using a block.
 @param block A block executed on each element.
 */
- (void)KS_each:(KSDictionaryEachBlock)block;

/**
 Iterate over each element using a block that includes a helpful iteration index.
 @param block A block executed on each element.
 */
- (void)KS_eachi:(KSDictionaryEachIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry.
 @return A collection where each element has had the block applied to it.
 */
- (NSDictionary *)KS_map:(KSDictionaryMapBlock)block;

/**
 An implementation of map from the map / reduce pattern that includes a helpful iteration index.
 @param block A block with an object that is execute on every entry with an index.
 @return A collection where each element has had the block applied to it.
 */
- (NSDictionary *)KS_mapi:(KSDictionaryMapIBlock)block;

/**
 An implementation of map from the map / reduce pattern.
 @param block A block with an object that is execute on every entry and a memo.
 @param memo The inital memo (NULL is fine).
 @return The value of memo that is returned after each block execution.
 */
- (id)KS_reduce:(KSDictionaryReduceBlock)block memo:(id)memo;

/**
 An implementation of find using a block for searching.
 @param block A block that is used for comparisons.
 */
- (id)KS_find:(KSDictionaryTestBlock)block;

/**
 Tests if any element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If any element in the collection passes the block test.
 */
- (BOOL)KS_any:(KSDictionaryTestBlock)block;

/**
 Tests if all element pass the block passed in for testing.
 @param block A block that is used for testing each element.
 @return If all elements in the collection passes the block test.
 */
- (BOOL)KS_all:(KSDictionaryTestBlock)block;

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
- (NSDictionary *)KS_filter:(KSDictionaryTestBlock)block;

/**
 Look through each entry in the collection returning all entries that fail the block test.
 @param block A block that is used for filtering.
 @return A rejected collection.
 */
- (NSDictionary *)KS_reject:(KSDictionaryTestBlock)block;

/**
 Helps to convert a dictionary to a set using a block on each key and value pair.
 @param block A dictionary used to do the reducing of a key and value pair to an object.
 @return A mapped set.
 */
- (NSSet *)KS_set:(KSDictionaryMapBlock)block;

/**
 Helps to convert a dictionary to an array using a block on each key and value pair.
 @param block A dictionary used to do the reducing of a key and value pair to an object.
 @return A mapped array.
 */
- (NSArray *)KS_array:(KSDictionaryMapBlock)block;

/**
 Construct a new dictionary by merging the target and the parameter.
 @param dictionary A dictionary to create or update the source keys with.
 */
- (NSDictionary *)KS_extend:(NSDictionary *)dictionary;

/**
 Similar to extend but in reverse.
 @param dictionary A dictionary used by the source.
 */
- (NSDictionary *)KS_defaults:(NSDictionary *)dictionary;

/**
 Retrieve the keys from the dictionary
 @return All the keys.
 */
- (NSSet *)KS_keys;

/**
 Retrieve the values from the dictionary
 @return All the values.
 */
- (NSArray *)KS_values;

/**
 Find the minimum (note: the elements must implement the `compare:`).
 @return The minimum value.
 */
- (id)KS_minimum;

/**
 Find the minimum (note: the elements must implement the `compare:`).
 @return The maximum value.
 */
- (id)KS_maximum;

/**
 Produce a random sample from the collection.
 @return A sample value.
 */
- (id)KS_sample;

@end
