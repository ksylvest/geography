//
//  NSDictionary+KSEnumerable.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import "NSDictionary+KSEnumerable.h"

@implementation NSDictionary (KSEnumerable)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Iterate

- (void)KS_each:(KSDictionaryEachBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        block(key, value);
    }
}

- (void)KS_eachi:(KSDictionaryEachIBlock)block
{
    NSInteger index = 0;
    for (id key in self)
    {
        id value = self[key];
        block(key, value, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (NSDictionary *)KS_map:(KSDictionaryMapBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];

        id mapped = block(key, value);
        if (mapped) results[key] = mapped;
    }
    
    return results;
}

- (NSDictionary *)KS_mapi:(KSDictionaryMapIBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    NSUInteger index = 0;
    for (id key in self)
    {
        id value = self[key];
        
        id mapped = block(key, value, index++);
        if (mapped) results[key] = mapped;
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)KS_reduce:(KSDictionaryReduceBlock)block memo:(id)memo
{
    for (id key in self)
    {
        id value = self[key];
        memo = block(memo, key, value);
    }
    
    return memo;
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)KS_find:(KSDictionaryTestBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        if (block(key, value)) return value;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)KS_any:(KSDictionaryTestBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        if (block(key, value)) return YES;
    }
    return NO;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - All

- (BOOL)KS_all:(KSDictionaryTestBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        if (!block(key, value)) return NO;
    }
    return YES;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Size

- (NSUInteger)KS_size
{
    return self.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (NSDictionary *)KS_filter:(KSDictionaryTestBlock)block
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        if (block(key, value))
        {
            results[key] = value;
        }
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Rejecting

- (NSDictionary *)KS_reject:(KSDictionaryTestBlock)block
{
    return [self KS_filter:[self KS_negate:block]];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Negating

- (KSDictionaryTestBlock)KS_negate:(KSDictionaryTestBlock)block
{
    return ^BOOL (id key, id value) { return !block(key, value); };
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSSet *)KS_set:(KSDictionaryMapBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        id object = block(key, value);
        [results addObject:object];
    }
    
    return results;
}

- (NSArray *)KS_array:(KSDictionaryMapBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        id object = block(key, value);
        [results addObject:object];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Extending

- (NSDictionary *)KS_extend:(NSDictionary *)extend
{
    NSMutableDictionary *results = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    for (id key in self)
    {
        id value = self[key];
        results[key] = value;
    }
    
    for (id key in extend)
    {
        id value = extend[key];
        results[key] = value;
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Defaults

- (NSDictionary *)KS_defaults:(NSDictionary *)dictionary
{
    return [dictionary KS_extend:self];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Conversions

- (NSSet *)KS_keys
{
    NSMutableSet *keys = [NSMutableSet setWithCapacity:self.count];
    for (id key in self)
    {
        [keys addObject:key];
    }
    return keys;
}

- (NSArray *)KS_values
{
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:self.count];
    for (id key in self)
    {
        [values addObject:self[key]];
    }
    return values;
}

@end
