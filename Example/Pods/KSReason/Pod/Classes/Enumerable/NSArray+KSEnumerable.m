//
//  NSArray+KSEnumerable.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import "NSArray+KSEnumerable.h"

@implementation NSArray (KSEnumerable)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Iterating

- (void)KS_each:(KSIterableEachBlock)block
{
    for (id object in self)
    {
        block(object);
    }
}

- (void)KS_eachi:(KSIterableEachIBlock)block
{
    NSUInteger index = 0;
    for (id object in self)
    {
        block(object, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (instancetype)KS_map:(KSIterableMapBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self)
    {
        id mapped = block(object);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

- (instancetype)KS_mapi:(KSIterableMapIBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    NSUInteger index = 0;
    for (id object in self)
    {
        id mapped = block(object, index++);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)KS_reduce:(KSIterableReduceBlock)block memo:(id)memo
{
    for (id object in self)
    {
        memo = block(memo, object);
    }
    
    return memo;
}

- (id)KS_reducei:(KSIterableReduceIBlock)block memo:(id)memo
{
    NSUInteger index = 0;
    for (id object in self)
    {
        memo = block(memo, object, index++);
    }
    
    return memo;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)KS_find:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return object;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)KS_any:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return YES;
    }
    return NO;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - All

- (BOOL)KS_all:(KSIterableTestBlock)block
{
    for (id object in self)
    {
        if (!block(object)) return NO;
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

#pragma mark - Empty

- (BOOL)KS_empty
{
    return !!self.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filtering

- (instancetype)KS_filter:(KSIterableTestBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self)
    {
        if (block(object))
        {
            [results addObject:object];
        }
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Rejecting

- (NSArray *)KS_reject:(KSIterableTestBlock)block
{
    return [self KS_filter:[self KS_negate:block]];
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSSet *)KS_set:(KSIterableMapBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id object in self)
    {
        [results addObject:block ? block(object) : object];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Negating

- (KSIterableTestBlock)KS_negate:(KSIterableTestBlock)block
{
    return ^BOOL (id object) { return !block(object); };
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Finders

- (id)KS_minimum
{
    return [self KS_reduce:^id(id memo, id object) {
        if ([memo compare:object] == NSOrderedAscending) return memo;
        else return object;
    } memo:NULL];
}

- (id)KS_maximum
{
    return [self KS_reduce:^id(id memo, id object) {
        if ([memo compare:object] == NSOrderedDescending) return memo;
        else return object;
    } memo:NULL];
}

- (id)KS_sample
{
    NSUInteger position = arc4random_uniform((int)self.count);
    
    NSInteger index = 0;
    for (id object in self)
    {
        if (index != position) index++;
        else return object;
    }
    
    return NULL;
}

@end
