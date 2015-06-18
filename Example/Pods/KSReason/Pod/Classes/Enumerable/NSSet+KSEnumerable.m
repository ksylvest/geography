//
//  NSSet+KSEnumerable.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#import "NSSet+KSEnumerable.h"

@implementation NSSet (KSEnumerable)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Iterate

- (void)KS_each:(KSSetEachBlock)block
{
    for (id object in self)
    {
        block(object);
    }
}

- (void)KS_eachi:(KSSetEachIBlock)block
{
    NSInteger index = 0;
    for (id object in self)
    {
        block(object, index++);
    }
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Map

- (NSSet *)KS_map:(KSSetMapBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
    for (id object in self)
    {
        id mapped = block(object);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

- (NSArray *)KS_mapi:(KSSetMapIBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    NSInteger index = 0;
    for (id object in self)
    {
        id mapped = block(object, index++);
        if (mapped) [results addObject:mapped];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Reduce

- (id)KS_reduce:(KSSetReduceBlock)block memo:(id)memo
{
    for (id object in self)
    {
        memo = block(memo, object);
    }
    
    return memo;
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark - Find

- (id)KS_find:(KSSetTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return object;
    }
    
    return NULL;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Any

- (BOOL)KS_any:(KSSetTestBlock)block
{
    for (id object in self)
    {
        if (block(object)) return YES;
    }
    return NO;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - All

- (BOOL)KS_all:(KSSetTestBlock)block
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

#pragma mark - Filtering

- (NSSet *)KS_filter:(KSSetTestBlock)block
{
    NSMutableSet *results = [NSMutableSet setWithCapacity:self.count];
    
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

- (NSSet *)KS_reject:(KSSetTestBlock)block
{
    return [self KS_filter:[self KS_negate:block]];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Converters

- (NSArray *)KS_array:(KSSetMapBlock)block
{
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id object in self)
    {
        [results addObject:block ? block(object) : object];
    }
    
    return results;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Negating

- (KSSetTestBlock)KS_negate:(KSSetTestBlock)block
{
    return ^BOOL (id object) { return !block(object); };
}

@end
