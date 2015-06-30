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

- (void)ks_each:(KSDictionaryEachBlock)block
{
    for (id key in self)
    {
        id value = self[key];
        block(key, value);
    }
}

- (void)ks_eachi:(KSDictionaryEachIBlock)block
{
    NSUInteger index = 0;
    for (id key in self)
    {
        id value = self[key];
        block(key, value, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (NSDictionary *)ks_map:(KSDictionaryMapBlock)block
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

- (NSDictionary *)ks_mapi:(KSDictionaryMapIBlock)block
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

- (id)ks_reduce:(KSDictionaryReduceBlock)block memo:(id)memo
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

- (id)ks_find:(KSDictionaryTestBlock)block
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

- (BOOL)ks_any:(KSDictionaryTestBlock)block
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

- (BOOL)ks_all:(KSDictionaryTestBlock)block
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

- (NSUInteger)ks_size
{
    return self.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (NSDictionary *)ks_filter:(KSDictionaryTestBlock)block
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

- (NSDictionary *)ks_reject:(KSDictionaryTestBlock)block
{
    return [self ks_filter:[self ks_negate:block]];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Negating

- (KSDictionaryTestBlock)ks_negate:(KSDictionaryTestBlock)block
{
    return ^BOOL (id key, id value) { return !block(key, value); };
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSSet *)ks_set:(KSDictionaryMapBlock)block
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

- (NSArray *)ks_array:(KSDictionaryMapBlock)block
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

- (NSDictionary *)ks_extend:(NSDictionary *)extend
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

- (NSDictionary *)ks_defaults:(NSDictionary *)dictionary
{
    return [dictionary ks_extend:self];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Conversions

- (NSSet *)ks_keys
{
    NSMutableSet *keys = [NSMutableSet setWithCapacity:self.count];
    for (id key in self)
    {
        [keys addObject:key];
    }
    return keys;
}

- (NSArray *)ks_values
{
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:self.count];
    for (id key in self)
    {
        [values addObject:self[key]];
    }
    return values;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Finders

- (id)ks_minimum
{
    return [self ks_reduce:^id(id memo, id key, id value) {
        if ([memo compare:value] == NSOrderedAscending) return memo;
        else return value;
    } memo:NULL];
}

- (id)ks_maximum
{
    return [self ks_reduce:^id(id memo, id key, id value) {
        if ([memo compare:value] == NSOrderedDescending) return memo;
        else return value;
    } memo:NULL];
}

- (id)ks_sample
{
    NSUInteger position = arc4random_uniform((int)self.count);
    
    NSInteger index = 0;
    for (id key in self)
    {
        if (index != position) index++;
        else return self[key];
    }
    
    return NULL;
}

@end
